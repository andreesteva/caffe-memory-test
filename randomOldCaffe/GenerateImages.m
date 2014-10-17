imsize_width = 256;
imsize_height = 256;
numImages_train = 100;
numImages_val = 10;
numClasses = 1000;

% Training Data: Create Images & write content to listfile
f = fopen('train.txt', 'w');
mkdir('train');
display(['generating training data ' num2str(imsize_height) 'x' num2str(imsize_width)]);
for i = 1:numImages_train  
    im = rand(imsize_height, imsize_width, 3);
    imwrite(im, ['./train/rand256im_train' num2str(i) '.jpg']);
    str2 = sprintf(['rand256im_train' num2str(i) '.jpg ' num2str(randi(numClasses)) '\n']);
    fwrite(f, str2);
end

% Training Data: Create Images & write content to listfile
f = fopen('val.txt', 'w');
mkdir('val');
display(['generating val data ' num2str(imsize_height) 'x' num2str(imsize_width)]);
for i = 1:numImages_val
    im = rand(imsize_height, imsize_width,3);
    imwrite(im, ['./val/rand256im_val' num2str(i) '.jpg']);
    str2 = sprintf(['rand256im_val' num2str(i) '.jpg ' num2str(randi(numClasses)) '\n']);
    fwrite(f, str2);
end
