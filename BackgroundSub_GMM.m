function BackgroundSub_GMM()
    %The following is initial parameters
    global input_folder_path ;
    global M; % number of gaussian component
    global D; %times of standard deviation, is used to determine wheather a pixel is close to a gaussian component
    global cf;%percentage of foreground pixels in an image
    global sigma0; % initial standard deviation of a new gaussian component
    global alpha; % learning rate;
    global gaussian_component;% store the M gaussian component
    global output_folder_path;
    
    initial(); % initial the global variable
    
    
    %image_files = dir(strcat(input_folder_path,'*.jpg'));
    %mov=aviread('Ori_WaterObject.avi');
    %aviobj = avifile('result','compression','none');
    %Vframes=size(mov,2); 
    %fLength = length(image_files);
    Vframes = 60;
    for i =1:Vframes
        fprintf('%d\\%d\n',i,Vframes);
        processImage(imread(strcat(input_folder_path,'/frame',num2str(i),'.bmp')),i);
        %processImage(mov(i).cdata(:,:,:),i);
        %aviobj = addframe(aviobj,output);
    end
    %aviobj = close(aviobj);
end

function initial ()
    global input_folder_path ;
    global M; % number of gaussian component
    global D; %times of standard deviation, is used to determine wheather a pixel is close to a gaussian component
    global cf;%percentage of foreground pixels in an image
    global sigma0; % initial standard deviation of a new gaussian component
    global alpha; % learning rate;
    global gaussian_component;
    global output_folder_path;
    input_folder_path =  '/Users/ywo130/Documents/MATLAB/EECS432/Data/555/seq1';
    output_folder_path = '/Users/ywo130/Documents/MATLAB/EECS432/Data/555/out_seq1';
    M = 5;
    D = 3;
    cf = 0.1;
    sigma0 = 5;
    alpha = 0.0001;
    gaussian_component = zeros(M,4);
    for i = 1:M
        gaussian_component(i,1) = randi(255)+1;%mean of the gaussian
        gaussian_component(i,2) = sigma0; % standard deviation
        gaussian_component(i,3) = 1/M; % prior weight
        gaussian_component(i,4) = 0;% 0 means background, 1 means foreground
    end
end