pathIn = './Data/555/seq1/';
close all;
files = dir([pathIn,'*.bmp']);
nFiles = length(files);
for ii = 1:min(nFiles,10)
    fName = files(ii).name; %Get the name of the file to read
    boxImage = imread([pathIn, fName]);
    boxImage = rgb2gray(boxImage);
    [row, col] = size(boxImage);
    boxImage5 = zeros(row,col,5,'uint8');
    if (ii == 1)
        fName2 = files(ii+1).name;
        fName3 = files(ii+2).name;
        fName4 = files(ii+3).name;
        fName5 = files(ii+4).name;
        boxImage5(:,:,1) = boxImage;
        boxImage5(:,:,2) = rgb2gray(imread([pathIn,fName2]));
        boxImage5(:,:,3) = rgb2gray(imread([pathIn,fName3]));
        boxImage5(:,:,4) = rgb2gray(imread([pathIn,fName4]));
        boxImage5(:,:,5) = rgb2gray(imread([pathIn,fName5]));
    elseif (ii == 2)
        fName2 = files(ii-1).name;
        fName3 = files(ii+1).name;
        fName4 = files(ii+2).name;
        fName5 = files(ii+3).name;
        boxImage5(:,:,1) = rgb2gray(imread([pathIn,fName2]));
        boxImage5(:,:,2) = boxImage;
        boxImage5(:,:,3) = rgb2gray(imread([pathIn,fName3]));
        boxImage5(:,:,4) = rgb2gray(imread([pathIn,fName4]));
        boxImage5(:,:,5) = rgb2gray(imread([pathIn,fName5]));  
    elseif (ii == nFiles)
        fName2 = files(ii-4).name;
        fName3 = files(ii-3).name;
        fName4 = files(ii-2).name;
        fName5 = files(ii-1).name;
        boxImage5(:,:,1) = rgb2gray(imread([pathIn,fName2]));
        boxImage5(:,:,2) = rgb2gray(imread([pathIn,fName3]));
        boxImage5(:,:,3) = rgb2gray(imread([pathIn,fName4]));
        boxImage5(:,:,4) = rgb2gray(imread([pathIn,fName5]));
        boxImage5(:,:,5) = boxImage;
    elseif (ii == nFiles-1)
        fName2 = files(ii-3).name;
        fName3 = files(ii-2).name;
        fName4 = files(ii-1).name;
        fName5 = files(ii+1).name;
        boxImage5(:,:,1) = rgb2gray(imread([pathIn,fName2]));
        boxImage5(:,:,2) = rgb2gray(imread([pathIn,fName3]));
        boxImage5(:,:,3) = rgb2gray(imread([pathIn,fName4]));
        boxImage5(:,:,4) = boxImage;
        boxImage5(:,:,5) = rgb2gray(imread([pathIn,fName5]));
    else
        fName2 = files(ii-2).name;
        fName3 = files(ii-1).name;
        fName4 = files(ii+1).name;
        fName5 = files(ii+2).name;
        boxImage5(:,:,1) = rgb2gray(imread([pathIn,fName2]));
        boxImage5(:,:,2) = rgb2gray(imread([pathIn,fName3]));
        boxImage5(:,:,3) = boxImage;
        boxImage5(:,:,4) = rgb2gray(imread([pathIn,fName4]));
        boxImage5(:,:,5) = rgb2gray(imread([pathIn,fName5]));
    end
    temp = sort(boxImage5,3);
    subtImage = temp(:,:,3);
end
