function l = Lucas_Kanade(f1, f2)
% load images and set parameters
I1 = double(f1);
I2 = double(f2);

window_s = 3;
threshold_rate = 0.999;

% compute gradient of image
fx = conv2(I1, 0.25 * [-1 1; -1 1],'same') + conv2(I2, 0.25 * [-1 1; -1 1],'same');
fy = conv2(I1, 0.25 * [-1 -1; 1 1],'same') + conv2(I2, 0.25 * [-1 -1; 1 1],'same');
ft = conv2(I1, 0.25 * ones(2),'same') + conv2(I2, -0.25 * ones(2),'same');

% compute gaussian or unit window
w_gauss = fspecial('gaussian',window_s,3);
w_gauss = w_gauss ./ max(w_gauss(:));
w_gauss = w_gauss(:);
w_unif = ones(window_s*window_s,1);
W = diag(w_unif); 

% calculate optical flow of each pixel
vx = zeros(size(I1));
vy = zeros(size(I1));
for i = ((window_s+1)/2) : (size(I1,1)-(window_s-1)/2)
    for j = ((window_s+1)/2) : (size(I1,2)-(window_s-1)/2)
        Ax = fx((i-(window_s-1)/2):(i+(window_s-1)/2),(j-(window_s-1)/2):(j+(window_s-1)/2));
        Ay = fy((i-(window_s-1)/2):(i+(window_s-1)/2),(j-(window_s-1)/2):(j+(window_s-1)/2));
        At = -ft((i-(window_s-1)/2):(i+(window_s-1)/2),(j-(window_s-1)/2):(j+(window_s-1)/2));
        A = zeros(length(Ax(:)),2);
        A(:,1)=Ax(:);
        A(:,2)=Ay(:);
        b = At(:);
        V = pinv(transpose(A)*W*W*A)*transpose(A)*W*W*b;
        vx(i,j) = V(1);
        vy(i,j) = V(2);
    end
end

% statistic vector norm
global r
r = sqrt(vx.^2 + vy.^2);
t_r = sort(r(:));
threshold = t_r(ceil(length(t_r)*threshold_rate));
l = zeros(size(r),'uint8');
for i=1:size(r,1)
    for j=1:size(r,2)
        if (r(i,j) >= threshold)
            l(i,j) = 255;
        else
            l(i,j) = 0;
        end
    end
end