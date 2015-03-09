global r
temp_r = r / max(r(:));
col = 0:(max(temp_r(:))-min(temp_r(:)))/100:max(temp_r(:));
n = zeros(size(col));
for i = 1:length(col)
    temp = im2bw(temp_r,col(i));
    temp_label = bwlabel(temp);
    n(i) = max(temp_label(:));
end
ng = gradient(n);
for i = length(col):1
    if abs(ng(i))>threshold
        h = im2bw(temp_r,col(i+1));
        break;
    end
end