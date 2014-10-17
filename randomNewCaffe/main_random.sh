#!/bin/sh
# Copy this folder into $CAFFE_ROOT/examples/$ANY_NAME

# To train on a different size input image:
# 	Open GenerateImages.m and change imsize
#	

TOOLS="../../build/tools"

# Call matlab to generate the images
# modify the matlab file to specify image size
echo "MATLAB is generating images..."
matlab -nodesktop -nosplash -r "GenerateImages;quit"

# Create leveldb files for the images
echo "Creating db files..."
./create_random.sh


#Compute Image Mean
echo "Computing Image Mean - lmdb"
$TOOLS/compute_image_mean.bin random_train_lmdb ./random_image_mean.binaryproto lmdb
#$TOOLS/compute_image_mean.bin random_train_leveldb ./random_image_mean.binaryproto leveldb

# Train Caffe
if [[ -z "$1" ]]; then
	echo "error: solver file must be passed as argument"
else
	../../.build_release/tools/caffe train --solver="$1"
fi


