function varargout = MARTINEZ_PROJECT(varargin)
% MARTINEZ_PROJECT MATLAB code for MARTINEZ_PROJECT.fig
%      MARTINEZ_PROJECT, by itself, creates a new MARTINEZ_PROJECT or raises the existing
%      singleton*.
%
%      H = MARTINEZ_PROJECT returns the handle to a new MARTINEZ_PROJECT or the handle to
%      the existing singleton*.
%
%      MARTINEZ_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MARTINEZ_PROJECT.M with the given input arguments.
%
%      MARTINEZ_PROJECT('Property','Value',...) creates a new MARTINEZ_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MARTINEZ_PROJECT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MARTINEZ_PROJECT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text6 to modify the response to help MARTINEZ_PROJECT

% Last Modified by GUIDE v2.5 22-Apr-2020 18:32:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MARTINEZ_PROJECT_OpeningFcn, ...
                   'gui_OutputFcn',  @MARTINEZ_PROJECT_OutputFcn, ...
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


% --- Executes just before MARTINEZ_PROJECT is made visible.
function MARTINEZ_PROJECT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MARTINEZ_PROJECT (see VARARGIN)

% Choose default command line output for MARTINEZ_PROJECT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MARTINEZ_PROJECT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MARTINEZ_PROJECT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all; %add this to clear memory after exiting

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text6
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveimage1.
function saveimage1_Callback(hObject, eventdata, handles)
% hObject    handle to saveimage1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

OriginalImage = getimage(handles.OutPut1);
[FileName, FolderName] = uiputfile('New image.jpg');
New = fullfile(FolderName, FileName);
imwrite(OriginalImage, New);



% --- Executes on button press in saveimage2.
function saveimage2_Callback(hObject, eventdata, handles)
% hObject    handle to saveimage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

OriginalImage = getimage(handles.OutPut2);
[FileName, FolderName] = uiputfile('New image.jpg');
New = fullfile(FolderName, FileName);
imwrite(OriginalImage, New);

% --- Executes on slider movement.
function Threshold_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

threshold = imread(OriginalImage);
ValueThreshold = get(handles.Threshold, 'Value');
Thresh = threshold;
Th = im2bw(Thresh, ValueThreshold);
axes(handles.OutPut2);
imshow(Th);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Brightness_Callback(hObject, eventdata, handles)
% hObject    handle to Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

brightness = imread(OriginalImage);
ValueBright = get(handles.Brightness, 'Value');
bright = (brightness * (ValueBright * 5));
axes(handles.OutPut2);
imshow(bright);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Morphologic.
function Morphologic_Callback(hObject, eventdata, handles)
% hObject    handle to Morphologic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

value = imread(OriginalImage);
morph = imopen(value, strel('disk', 28));
axes(handles.OutPut2);
imshow(morph);

% --- Executes on button press in Subtraction.
function Subtraction_Callback(hObject, eventdata, handles)
% hObject    handle to Subtraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

subtraction = imread(OriginalImage);
imagesubtract = imopen(subtraction, strel('disk', 15));
ProcessedImage = imsubtract(subtraction, imagesubtract);
axes(handles.OutPut2);
imshow(ProcessedImage);
% --- Executes on selection change in FIR_Type.

function FIR_Type_Callback(hObject, eventdata, handles)
% hObject    handle to FIR_Type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global ProcessedImage;

popFir = get(hObject, 'Value');
switch popFir
    case 1
        ProcessedImage = imread(OriginalImage);
        axes(handles.OutPut2);
        imshow(ProcessedImage);
    case 2
        ProcessedImage = imread(OriginalImage);
        hObject = fspecial('motion', 70, 50);
        ProcessedImage = imfilter(ProcessedImage, hObject);
        axes(handles.OutPut2);
        imshow(ProcessedImage);
    case 3
        ProcessedImage = imread(OriginalImage);
        hObject = fspecial('motion', 50, 40);
        ProcessedImage = imfilter(ProcessedImage, hObject,'replicate');
        axes(handles.OutPut2);
        imshow(ProcessedImage);
    case 4
        ProcessedImage = imread(OriginalImage);
        hObject = fspecial('motion', 50, 45);
        ProcessedImage = imfilter(ProcessedImage, hObject,'full');
        axes(handles.OutPut2);
        imshow(ProcessedImage);
end
        
% Hints: contents = cellstr(get(hObject,'String')) returns FIR_Type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FIR_Type


% --- Executes during object creation, after setting all properties.
function FIR_Type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FIR_Type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Original.
function Original_Callback(hObject, eventdata, handles)
% hObject    handle to Original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

original = imread(OriginalImage);
axes(handles.OutPut1);
imshow(original);
% Hint: get(hObject,'Value') returns toggle state of Original

% --- Executes on button press in Binary.
function Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

Binary = imread(OriginalImage);
ProcessedImage = im2bw(Binary);
axes(handles.OutPut1);
imshow(ProcessedImage);
% Hint: get(hObject,'Value') returns toggle state of Binary

% --- Executes on button press in Indexed.
function Indexed_Callback(hObject, eventdata, handles)
% hObject    handle to Indexed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

Index = imread(OriginalImage);
[IND, map] = rgb2ind(Index, 128);
axes(handles.OutPut1);
imshow(IND);

% --- Executes on button press in Intensity.
function Intensity_Callback(hObject, eventdata, handles)
% hObject    handle to Intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

Intensity = imread(OriginalImage);
Gray = rgb2gray(Intensity);
axes(handles.OutPut1);
imshow(Gray);
% Hint: get(hObject,'Value') returns toggle state of Indexed

% --- Executes on button press in Multiframe.
function Multiframe_Callback(hObject, eventdata, handles)
% hObject    handle to Multiframe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

Multiframe = imread(OriginalImage);
MultiFrame = repmat(Multiframe, [1 1 1 4]);
axes(handles.OutPut1);
montage(MultiFrame);
% Hint: get(hObject,'Value') returns toggle state of Multiframe






% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global FileName;
global PathName;

[FileName, PathName] = uigetfile('*.png; *.jpg; *.bmp', 'Pick an Image');
OriginalImage = [PathName, FileName];
I = imread(OriginalImage);
axes(handles.Input);
imshow(I);

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

axes(handles.Input);
cla(handles.Input, 'reset');
set(handles.Input, 'visible', 'on');



% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

OriginalImage = getimage(handles.Input);
[FileName, FolderName] = uiputfile('New image.jpg');
New = fullfile(FolderName, FileName);
imwrite(OriginalImage, New);

% --- Executes on button press in Clearall.
function Clearall_Callback(hObject, eventdata, handles)
% hObject    handle to Clearall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;

axes(handles.Input);
axes(handles.OutPut1);
axes(handles.OutPut2);

cla(handles.Input, 'reset');
cla(handles.OutPut1, 'reset');
cla(handles.OutPut2, 'reset');

set(handles.Input, 'visible', 'on');
set(handles.OutPut1, 'visible', 'on');
set(handles.OutPut2, 'visible', 'on');


% --- Executes on button press in Red.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global ProcessedImage;

ProcessedImage = imread(OriginalImage);
ProcessedImage(:,:,2:3) = 0;
axes(handles.OutPut1);
imshow(ProcessedImage);

% --- Executes on button press in Green.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global ProcessedImage;

ProcessedImage = imread(OriginalImage);
ProcessedImage(:,:,1) = 0;
ProcessedImage(:,:,3) = 0;
axes(handles.OutPut1);
imshow(ProcessedImage);
% Hint: get(hObject,'Value') returns toggle state of Green


% --- Executes on button press in Blue.
function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global ProcessedImage;

ProcessedImage = imread(OriginalImage);
ProcessedImage(:,:,1) = 0;
ProcessedImage(:,:,2) = 0;
axes(handles.OutPut1);
imshow(ProcessedImage);
% Hint: get(hObject,'Value') returns toggle state of Blue


% --- Executes on slider movement.
function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global OriginalImage;

contrast = imread(OriginalImage);
ValueContrast = get(handles.Contrast, 'Value');
ProcessedImage = localcontrast(contrast, 1, ValueContrast);
axes(handles.OutPut2);
imshow(ProcessedImage);

% --- Executes during object creation, after setting all properties.
function Contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
