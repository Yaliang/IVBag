function h = Horn_Schunck(f1, f2)
% load images and set parameters
I1 = double(f1);
I2 = double(f2);
% skip_step=10;
max_iteration = 100;
lambda = 100;
threshold_rate = 0.995;
%avg_marker = [1/12 1/6 1/12; 1/6 0 1/6; 1/12 1/6 1/12];
avg_marker = fspecial('average',3);
avg_marker = avg_marker ./ sum(avg_marker(:));

% image smooth
smooth_win = fspecial('gaussian',13,1.5);
smooth_win = smooth_win ./ sum(smooth_win(:));
smoothedImg=conv2(I1,smooth_win,'same');
I1=conv2(smoothedImg,smooth_win','same');
smoothedImg=conv2(I2,smooth_win,'same');
I2=conv2(smoothedImg,smooth_win','same');

% compute gradient of image
fx = conv2(I1, 0.25 * [-1 1; -1 1],'same') + conv2(I2, 0.25 * [-1 1; -1 1],'same');
fy = conv2(I1, 0.25 * [-1 -1; 1 1],'same') + conv2(I2, 0.25 * [-1 -1; 1 1],'same');
ft = conv2(I1, 0.25 * ones(2),'same') + conv2(I2, -0.25 * ones(2),'same');

% set initial value of optical flow
vx = zeros(size(I1));
vy = zeros(size(I1));
vx_avg = vx;
vy_avg = vy;
for i = 1:max_iteration
    alpha = ((fx.*vx_avg)+(fy.*vy_avg)+ft)./(lambda+fx.^2+fy.^2);
    vx = vx_avg - alpha.*fx;
    vy = vy_avg - alpha.*fy;
    vx_avg = conv2(vx, avg_marker, 'same');
    vy_avg = conv2(vy, avg_marker, 'same');
end

% statistic vector norm
global r
r = sqrt(vx.^2 + vy.^2);
t_r = sort(r(:));
threshold = t_r(ceil(length(t_r)*threshold_rate));
h = zeros(size(r),'uint8');
for i=1:size(r,1)
    for j=1:size(r,2)
        if (r(i,j) >= threshold)
            h(i,j) = 255;
        else
            h(i,j) = 0;
        end
    end
end
