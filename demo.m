function varargout = demo(varargin)
% DEMO MATLAB code for demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo

% Last Modified by GUIDE v2.5 08-Mar-2015 21:21:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before demo is made visible.
function demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo (see VARARGIN)

% Choose default command line output for demo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global f
loadfromArchive = false;
if loadfromArchive
    loadArchive();
else
    % load images
%     path_base = '/Users/ywo130/Documents/MATLAB/EECS432/Data/9991/seq1';
%     %path_base = '/courses/432/EECS432/Data/555/seq1';
%     for i=1:60
%         img = imread( strcat(path_base,'/frame',num2str(i),'.bmp') );
%         % f.(strcat('Frame',num2str(i),'_Original_RGB')) = img(:,351:2650,:);
%         f.(strcat('Frame',num2str(i),'_Original_RGB')) = img;
%         f.(strcat('Frame',num2str(i),'_Original_Grayscale')) = rgb2gray(f.(strcat('Frame',num2str(i),'_Original_RGB')));
%     end
%     subsBack();
%     motionHilight();
      imgCloseAndLabel();
      
end
frmlist = {};
for i=1:60
    frmlist = [frmlist {strcat('Frame', num2str(i))}];
end
set(handles.listbox4,'String',frmlist);
axes(handles.axes1);
imshow(f.Frame1_Original_RGB);
axis off;


% --- Outputs from this function are returned to the command line.
function varargout = demo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
rePlotImage(handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
rePlotImage(handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function rePlotImage(handles)
global f
types = cellstr(get(handles.listbox3,'String'));
type = types{get(handles.listbox3,'Value')};
frames = cellstr(get(handles.listbox4,'String'));
frame = frames{get(handles.listbox4,'Value')};
axes(handles.axes1);
xlim = get(handles.axes1, 'XLim');
ylim = get(handles.axes1, 'YLim');
imshow(f.(strcat(frame,'_',type)));
set(handles.axes1, 'XLim', xlim);
set(handles.axes1, 'YLim', ylim);
axis off;

function subsBack()
global f
%% MOD 3 amplifying differences on dark spots (printing)
%Table for amplifying differences on dark spots
% AK 9/14/2011 
%            | 
% FACTOR     |-_      (function)
%            |  \
%            |   \
%            |    |___________________
%            |________________________
%                UPPERLIMIT
%

UPPERLIMIT = 55; %55       
FACTOR = 1.4;    %1.4
BASE = 1.5;      %1.5
USE_IMPRINT_COMPENSATION = 1; %if set to 0, the imprint compensation is not used
ampTable = ones(256,1);
if USE_IMPRINT_COMPENSATION
    for x = 1:UPPERLIMIT
        ampTable(x) = -(FACTOR-1)*(BASE^x)/(BASE^UPPERLIMIT)+FACTOR; %quadratic
    end
end
%% MOD 3 end

[row, col] = size(f.Frame1_Original_Grayscale);
totalImg = zeros(row,col,60,'uint8');
for i = 1:60
    totalImg(:,:,i) = f.(strcat('Frame',num2str(i),'_Original_Grayscale'));
end
%temp = sort(totalImg(:,:,:),3);
for i = 1:60
    temp = sort(totalImg(:,:,i:min(i+4,60)),3);
    f.(strcat('Frame',num2str(i),'_Background')) = temp(:,:,min(3,round((61-i)/2)));
    img_diff = imabsdiff(f.(strcat('Frame',num2str(i),'_Background')),f.(strcat('Frame',num2str(i),'_Original_Grayscale')));
    %f.(strcat('Frame',num2str(i),'_Background')) = temp(:,:,30);
    f.(strcat('Frame',num2str(i),'_Foreground')) = uint8(ampTable(f.(strcat('Frame',num2str(i),'_Original_Grayscale'))+1).*double(img_diff));
%     minF = min(f.(strcat('Frame',num2str(i),'_Foreground'))(:));
%     maxF = max(f.(strcat('Frame',num2str(i),'_Foreground'))(:));
%     f.(strcat('Frame',num2str(i),'_Foreground')) = uint8(round((255/double(maxF-minF))*double((f.(strcat('Frame',num2str(i),'_Foreground'))-minF*ones(size(f.(strcat('Frame',num2str(i),'_Foreground'))),'uint8')))));
    f.(strcat('Frame',num2str(i),'_Foreground')) = im2bw(f.(strcat('Frame',num2str(i),'_Foreground')),(11/255));
    display(strcat('Frame', num2str(i), '_Foreground'));
end

function motionHilight()
global f
f.(strcat('Frame',num2str(1),'_Hi_Light_Motion')) = zeros(size(f.(strcat('Frame',num2str(1),'_Original_Grayscale'))),'uint8');
for i = 4:60
    f.(strcat('Frame',num2str(i),'_Hi_Light_Motion')) = Horn_Schunck(f.(strcat('Frame',num2str(i-1),'_Original_Grayscale')),f.(strcat('Frame',num2str(i),'_Original_Grayscale')));
    display(strcat('Frame',num2str(i),'_Hi_Light_Motion'));
end

function imgCloseAndLabel()
global f
f.(strcat('Frame',num2str(1),'_Close')) = zeros(size(f.(strcat('Frame',num2str(1),'_Original_Grayscale'))),'uint8');
SE = strel('diamond',2);                            % ('disk', 18, 8 )
SE2 = strel('diamond',2);                            % ('disk', 10, 8 )
for i = 1:60
    image_dilated = imdilate(f.(strcat('Frame',num2str(i),'_Hi_Light_Motion')),SE);
    f.(strcat('Frame',num2str(i),'_Close')) = imerode(image_dilated,SE2);
    f.(strcat('Frame',num2str(i),'_Label'))(:,:,1) = uint8(double(f.(strcat('Frame',num2str(i),'_Close'))).*double(bwlabel(f.(strcat('Frame',num2str(i),'_Close')),8)));
    f.(strcat('Frame',num2str(i),'_Label'))(:,:,2) = uint8(double(f.(strcat('Frame',num2str(i),'_Close'))).*double(255-bwlabel(f.(strcat('Frame',num2str(i),'_Close')),8)));
    f.(strcat('Frame',num2str(i),'_Label'))(:,:,3) = uint8(double(f.(strcat('Frame',num2str(i),'_Close'))).*double(128-0.5*bwlabel(f.(strcat('Frame',num2str(i),'_Close')),8)));
    display(strcat('Frame',num2str(i),'_Close'));
end

function loadArchive()
global f
path_base = '/Users/ywo130/Documents/MATLAB/IVBag/Archive1';
for i=1:60
    f.(strcat('Frame',num2str(i),'_Original_RGB')) = imread(strcat(path_base,'/f_Frame_',num2str(i),'_Original_RGB.bmp'));
    f.(strcat('Frame',num2str(i),'_Original_Grayscale')) = imread(strcat(path_base,'/f_Frame_',num2str(i),'_Original_Grayscale.bmp'));
    f.(strcat('Frame',num2str(i),'_Foreground')) = imread(strcat(path_base,'/f_Frame_',num2str(i),'_Foreground.bmp'));
    f.(strcat('Frame',num2str(i),'_Background')) = imread(strcat(path_base,'/f_Frame_',num2str(i),'_Background.bmp'));
    f.(strcat('Frame',num2str(i),'_Hi_Light_Motion')) = imread(strcat(path_base,'/f_Frame_',num2str(i),'_Hi_Light_Motion.bmp'));
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
rePlotImage(handles);

% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4
rePlotImage(handles);

% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    
