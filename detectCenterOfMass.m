function detectCenterOfMass()
global f
mask = uint8([0 1 0; 1 1 1; 0 1 0]);
strel_mask = strel('diamond',1);
for i=1:60
    img = uint8(f.(strcat('Frame',num2str(i),'_Close')));
    img_mask = conv2(double(img),double(mask),'same');
    img_centered = zeros(size(f.(strcat('Frame',num2str(i),'_Close'))),'uint8');
    while sum(img_mask(:))
        img_add = sign((1 - sign(double(img_mask) -4))).*sign(img_mask);
        img_centered = img_centered + uint8(255*img_add);
        img = imerode(img,strel_mask);
        img_mask = conv2(img,mask,'same');
    end
    f.(strcat('Frame',num2str(i),'_Centered')) = img_centered;
    display(strcat('Frame',num2str(i),'_Centered'));
end