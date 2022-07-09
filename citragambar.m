function varargout = citragambar(varargin)
% CITRAGAMBAR MATLAB code for citragambar.fig
%      CITRAGAMBAR, by itself, creates a new CITRAGAMBAR or raises the existing
%      singleton*.
%
%      H = CITRAGAMBAR returns the handle to a new CITRAGAMBAR or the handle to
%      the existing singleton*.
%
%      CITRAGAMBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CITRAGAMBAR.M with the given input arguments.
%
%      CITRAGAMBAR('Property','Value',...) creates a new CITRAGAMBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before citragambar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to citragambar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help citragambar

% Last Modified by GUIDE v2.5 08-Jul-2022 15:40:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @citragambar_OpeningFcn, ...
                   'gui_OutputFcn',  @citragambar_OutputFcn, ...
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


% --- Executes just before citragambar is made visible.
function citragambar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to citragambar (see VARARGIN)

% Choose default command line output for citragambar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes citragambar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = citragambar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[nama_file, nama_path] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';}, 'Buka Gambar');
if ~isequal(nama_file, 0)
    handles.data1 = imread(fullfile(nama_path, nama_file));
    guidata(hObject, handles);
    axes(handles.axes1);
    imshow(handles.data1);
    title('Citra Asli');
else
    return
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
citra = handles.data1;
axes(handles.axes1)
imshow(citra)
title('Gambar Asli');

h = imrect;
position = wait(h);
hasil1 = imcrop(citra,position);
handles.hasil1 = hasil1;
axes(handles.axes2)
imshow(hasil1);
title('Hasil Crrop Gambar');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
gambar = (handles.data1);
gaussianFilter = fspecial('gaussian', [50, 50], 50)
hasil = imfilter(gambar, gaussianFilter, 'symmetric', 'conv');
axes(handles.axes2);
imshow(hasil);
title('Hasil Blur');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
axes(handles.axes2);
[nama_file_simpan, path_simpan] = uiputfile({'*.jpg','File JPEG(*.jpg)';'*.bmp','File BMP(*.bmp)';'*.*','Semua File(*.*)'},'menyimpan');
nama = fullfile(path_simpan, nama_file_simpan);
F = getframe(handles.axes2);
W = frame2im(F);
imwrite(W, nama, 'bmp');

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
