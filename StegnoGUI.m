function varargout = StegnoGUI(varargin)
% STEGNOGUI M-file for StegnoGUI.fig
%      STEGNOGUI, by itself, creates a new STEGNOGUI or raises the existing
%      singleton*.
%
%      H = STEGNOGUI returns the handle to a new STEGNOGUI or the handle to
%      the existing singleton*.
%
%      STEGNOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEGNOGUI.M with the given input arguments.
%
%      STEGNOGUI('Property','Value',...) creates a new STEGNOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StegnoGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StegnoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StegnoGUI

% Last Modified by GUIDE v2.5 08-Nov-2014 17:19:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StegnoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @StegnoGUI_OutputFcn, ...
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


% --- Executes just before StegnoGUI is made visible.
function StegnoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StegnoGUI (see VARARGIN)

% Choose default command line output for StegnoGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global img
global Message
global len
global Msglayer
global lenlayer
global passlayer
global password

% UIWAIT makes StegnoGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StegnoGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in encodingload.
function encodingload_Callback(hObject, eventdata, handles)
% hObject    handle to encodingload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
 [File,Path] = uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select "IMAGE" to Hide Message.');
    img = imread([Path,File]);
imshow(img);


function Msg_Callback(hObject, eventdata, handles)
% hObject    handle to Msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Msg as text
%        str2double(get(hObject,'String')) returns contents of Msg as a double
global Message
global len
Message= get(handles.Msg,'string');
len= length(Message);
% --- Executes during object creation, after setting all properties.
function Msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function msglength_Callback(hObject, eventdata, handles)
% hObject    handle to msglength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msglength as text
%        str2double(get(hObject,'String')) returns contents of msglength as a double
global lenlayer
global img
global len
lenlayer = str2double(get(handles.msglength,'string'));
img(50,50,lenlayer)= len;

% --- Executes during object creation, after setting all properties.
function msglength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msglength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function msgencoding_Callback(hObject, eventdata, handles)
% hObject    handle to msgencoding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msgencoding as text
%        str2double(get(hObject,'String')) returns contents of msgencoding as a double
global Msglayer
Msglayer = str2double(get(handles.msgencoding,'string'));

% --- Executes during object creation, after setting all properties.
function msgencoding_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msgencoding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function passwrdlayer_Callback(hObject, eventdata, handles)
% hObject    handle to passwrdlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passwrdlayer as text
%        str2double(get(hObject,'String')) returns contents of passwrdlayer as a double
global passlayer
passlayer = str2double(get(handles.passwrdlayer,'string'));

% --- Executes during object creation, after setting all properties.
function passwrdlayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passwrdlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
global password
password = str2double(get(handles.edit7,'string'));

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function encodefilename_Callback(hObject, eventdata, handles)
% hObject    handle to encodefilename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of encodefilename as text
%        str2double(get(hObject,'String')) returns contents of encodefilename as a double



% --- Executes during object creation, after setting all properties.
function encodefilename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to encodefilename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Encodebutton.
function Encodebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Encodebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global Message
global len
global Msglayer
global passlayer
global password
len
Msglayer
password
passlayer
Message(1)

for i=1:len;
            if Msglayer==1;
                img(2,i,1)=Message(i);
            elseif Msglayer==2;
                img(2,i,2)=Message(i);
            else 
                img(2,i,3)=Message(i);
            end
end
if passlayer==1;
                img(3,1,1)=password;
            elseif passlayer==2;
                img(3,1,2)=password;
            else 
                img(3,1,3)=password;
end
img(2,1,2)
imwrite(img,'encoded_Image.png')
