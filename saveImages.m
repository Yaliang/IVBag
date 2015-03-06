function saveImages()
global f
for i=1:60
    imwrite(f.(strcat('Frame',num2str(i),'_Original_RGB')), strcat('f_Frame_', num2str(i),'_Original_RGB.bmp'));
    imwrite(f.(strcat('Frame',num2str(i),'_Original_Grayscale')), strcat('f_Frame_', num2str(i),'_Original_Grayscale.bmp'));
    imwrite(f.(strcat('Frame',num2str(i),'_Foreground')), strcat('f_Frame_', num2str(i),'_Foreground.bmp'));
    imwrite(f.(strcat('Frame',num2str(i),'_Background')), strcat('f_Frame_', num2str(i),'_Background.bmp'));
    imwrite(f.(strcat('Frame',num2str(i),'_Hi_Light_Motion')), strcat('f_Frame_', num2str(i),'_Hi_Light_Motion.bmp'));
end