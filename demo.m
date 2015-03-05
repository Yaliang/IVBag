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

% Last Modified by GUIDE v2.5 03-Mar-2015 21:24:08

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
% load images
global f
path_base = 'C:\Users\Yaliang\Documents\northwestern u\course\EECS432\Project\EECS432\Data\555\seq1';
%path_base = '/courses/432/EECS432/Data/555/seq1';
frmlist = {};
for i=1:60
    f.(strcat('Frame',num2str(i),'_Original_RGB')) = imread( strcat(path_base,'\frame',num2str(i),'.bmp') );
    f.(strcat('Frame',num2str(i),'_Original_Grayscale')) = rgb2gray(f.(strcat('Frame',num2str(i),'_Original_RGB')));
    frmlist = [frmlist {strcat('Frame', num2str(i))}];
end
set(handles.popupmenu2,'String',frmlist);
axes(handles.axes1);
imshow(f.Frame1_Original_RGB);
axis off;
subsBack();



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
types = cellstr(get(handles.popupmenu1,'String'));
type = types{get(handles.popupmenu1,'Value')};
frames = cellstr(get(handles.popupmenu2,'String'));
frame = frames{get(handles.popupmenu2,'Value')};
trackings = cellstr(get(handles.popupmenu3,'String'));
tracking = trackings{get(handles.popupmenu3,'Value')};
display(type);
display(frame);
display(tracking);
axes(handles.axes1);
xlim = get(handles.axes1, 'XLim');
ylim = get(handles.axes1, 'YLim');
imshow(f.(strcat(frame,'_',type)));
set(handles.axes1, 'XLim', xlim);
set(handles.axes1, 'YLim', ylim);
axis off;

function subsBack()
global f
[row, col] = size(f.Frame1_Original_Grayscale);
totalImg = zeros(row,col,60,'uint8');
for i = 1:60
    totalImg(:,:,i) = f.(strcat('Frame',num2str(i),'_Original_Grayscale'));
end
%temp = sort(totalImg(:,:,:),3);
for i = 1:60
    temp = sort(totalImg(:,:,i:min(i+4,60)),3);
    f.(strcat('Frame',num2str(i),'_Background')) = temp(:,:,min(3,round((61-i)/2)));
    %f.(strcat('Frame',num2str(i),'_Background')) = temp(:,:,30);
    f.(strcat('Frame',num2str(i),'_Foreground')) = abs(f.(strcat('Frame',num2str(i),'_Background'))-f.(strcat('Frame',num2str(i),'_Original_Grayscale')));
    minF = min(f.(strcat('Frame',num2str(i),'_Foreground'))(:));
    maxF = max(f.(strcat('Frame',num2str(i),'_Foreground'))(:));
    f.(strcat('Frame',num2str(i),'_Foreground')) = uint8(round((255/double(maxF-minF))*double((f.(strcat('Frame',num2str(i),'_Foreground'))-minF*ones(size(f.(strcat('Frame',num2str(i),'_Foreground'))),'uint8')))));
end