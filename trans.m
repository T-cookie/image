dirs=dir('./images_test1000/*.bmp');
for n=1:numel(dirs)
strname=strcat('./images_test1000/',dirs(n).name);
img=imread(strname);
[x,map]=rgb2ind(img,256);
newname=strcat('./images_test1000/',dirs(n).name);
imwrite(x,map,newname,'bmp');
end