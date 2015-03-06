function processImage (inputImage,num)
    global input_folder_path ;
    global M; % number of gaussian component
    global D; %times of standard deviation, is used to determine wheather a pixel is close to a gaussian component
    global cf;%percentage of foreground pixels in an image
    global sigma0; % initial standard deviation of a new gaussian component
    global alpha; % learning rate;
    global gaussian_component;% store the M gaussian component
    global output_folder_path;
    
    %image_path = strcat(input_folder_path,image_name);
    %inputImage = imread(image_path);
    grayImage = rgb2gray(inputImage);
    grayImage = double(grayImage);
    [row,col] = size (grayImage);
    outputImage = zeros(row,col);
    for i =1:row
        for j=1:col
            if processOnePixel(grayImage(i,j)) == 0 %0 stands for background
                outputImage(i,j) = 0;
            else
                outputImage(i,j) = grayImage(i,j);
            end
        end
    end
    %store the image
    imwrite (uint8(outputImage),strcat(output_folder_path,int2str(num),'.jpg'),'jpg');
end

function reval = processOnePixel(pixelValue)
    %global input_folder_path ;
    global M; % number of gaussian component
    global D; %times of standard deviation, is used to determine wheather a pixel is close to a gaussian component
    global cf;%percentage of foreground pixels in an image
    global sigma0; % initial standard deviation of a new gaussian component
    global alpha; % learning rate;
    global gaussian_component;% store the M gaussian component
   
    matched = 0;
    delta = zeros(1,M);
    owner = zeros(1,M);
    maxPrior = max(gaussian_component(:,3));
    temp = find(gaussian_component(:,3)==maxPrior);
    maxPriorIndex = temp(1);
    for i =1:M
        delta(1,i) = pixelValue - gaussian_component(i,1);
        distance = sqrt(delta(1,i)*delta(1,i)/(gaussian_component(i,2)^2));
        if(distance <= D*gaussian_component(i,2) && i==maxPriorIndex)
            matched = 1;
            owner(1,i) = 1;
        end
    end
    
    if matched ==0
        % if none of the component is matched, then repalce the component
        % with smallest prior.
        minPrior = min (gaussian_component(:,3));
        temp = find (gaussian_component(:,3)==minPrior);
        minPriorIndex = temp(1);
        gaussian_component(minPriorIndex,1) = pixelValue;
        gaussian_component(minPriorIndex,2) = sigma0;
        gaussian_component(minPriorIndex,3) = alpha;
        gaussian_component(minPriorIndex,4) = 0;
        owner(1,minPriorIndex) = 1;
    end    
    
    % update parameters
    for i = 1:M
        prior_m = gaussian_component(i,3);
        gaussian_component(i,3) = prior_m + alpha * (owner(1,i) - prior_m);
        if owner(1,i)==1         
             mean_m  = gaussian_component(i,1);
             sigma_m = gaussian_component(i,2);
             rou = alpha * 1/(sqrt(2*pi)*sigma_m) * exp(-(pixelValue-mean_m)^2/(2*sigma_m^2));
             gaussian_component(i,1) = (1-rou)*mean_m + rou*pixelValue;
             gaussian_component(i,2) = sqrt((1-rou)*sigma_m^2 + rou*delta(1,i)*delta(1,i));
%             gaussian_component(i,1) = mean_m + owner(1,i) *(alpha/prior_m)* sigma_m;
%             gaussian_component(i,2) = sqrt(sigma_m^2 + owner(1,i)*(alpha/prior_m)*(delta(1,i)^2-sigma_m^2));
        end
    end
    % re-normalize the prior
    sumPrior = sum(gaussian_component(:,3));
    for i = 1:M
        gaussian_component(i,3) = gaussian_component(i,3) / sumPrior;
    end
    %find the background component and foreground component
    [sPrior,index] = sort(gaussian_component(:,3),'descend');
    cum = 0;
    stop_index = 0;
    for i=1:M
        cum = cum + sPrior(i,1);
        if cum > 1 - cf
            stop_index = i;
            break;
        end
    end
    for i = 1:stop_index
        gaussian_component(index(i,1),4) = 0;
    end
    for i = stop_index+1:M
        gaussian_component(index(i,1),4) = 1;
    end
    index = find(owner==1);
    reval = gaussian_component(index,4);
end