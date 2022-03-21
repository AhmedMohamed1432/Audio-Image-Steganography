function varargout = stegGUIdec(varargin)
% STEGGUIDEC M-file for stegGUIdec.fig
%      STEGGUIDEC, by itself, creates a new STEGGUIDEC or raises the existing
%      singleton*.
%
%      H = STEGGUIDEC returns the handle to a new STEGGUIDEC or the handle to
%      the existing singleton*.
%
%      STEGGUIDEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEGGUIDEC.M with the given input arguments.
%
%      STEGGUIDEC('Property','Value',...) creates a new STEGGUIDEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stegGUIdec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stegGUIdec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stegGUIdec

% Last Modified by GUIDE v2.5 08-Nov-2014 17:40:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stegGUIdec_OpeningFcn, ...
                   'gui_OutputFcn',  @stegGUIdec_OutputFcn, ...
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


% --- Executes just before stegGUIdec is made visible.
function stegGUIdec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stegGUIdec (see VARARGIN)

% Choose default command line output for stegGUIdec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stegGUIdec wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global img
global Messagelayer
global Lengthlayer
global Password
global Passwordlayer

% --- Outputs from this function are returned to the command line.
function varargout = stegGUIdec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Loading.
function Loading_Callback(hObject, eventdata, handles)
% hObject    handle to Loading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
 [File,Path] = uigetfile({'*.jpg';'*.png';'*.gif';'*.bmp'},'Select "IMAGE" to decode Message.');
    img = imread([Path,File]);
imshow(img);


function Msglay_Callback(hObject, eventdata, handles)
% hObject    handle to Msglay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Msglay as text
%        str2double(get(hObject,'String')) returns contents of Msglay as a double
global Messagelayer
Messagelayer = str2double(get(handles.Msglay,'string'));

% --- Executes during object creation, after setting all properties.
function Msglay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Msglay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lenlay_Callback(hObject, eventdata, handles)
% hObject    handle to Lenlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lenlay as text
%        str2double(get(hObject,'String')) returns contents of Lenlay as a double
global Lengthlayer
Lengthlayer = str2double(get(handles.Lenlay,'string'));


% --- Executes during object creation, after setting all properties.
function Lenlay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lenlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Passlay_Callback(hObject, eventdata, handles)
% hObject    handle to Passlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Passlay as text
%        str2double(get(hObject,'String')) returns contents of Passlay as a double
global Passwordlayer
Passwordlayer = str2double(get(handles.Passlay,'string'));


% --- Executes during object creation, after setting all properties.
function Passlay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Passlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Passwrd_Callback(hObject, eventdata, handles)
% hObject    handle to Passwrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Passwrd as text
%        str2double(get(hObject,'String')) returns contents of Passwrd as a double
global Password
Password = str2double(get(handles.Passwrd,'string'));


% --- Executes during object creation, after setting all properties.
function Passwrd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Passwrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Extract.
function Extract_Callback(hObject, eventdata, handles)
% hObject    handle to Extract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global Messagelayer
global Lengthlayer
global Password
global Passwordlayer

if Passwordlayer==1;
                pass = img(3,1,1);
            elseif Passwordlayer==2;
                pass = img(3,1,2);
            else 
                pass = img(3,1,3);
end
if Lengthlayer==1;
                len = img(50,50,1);
            elseif Lengthlayer==2;
                len = img(50,50,2);
            else 
                len = img(50,50,3);
end
for i=1:len
            if Messagelayer==1;
                string(i)= img(2,i,1);
            elseif Messagelayer==2;
                string(i)= img(2,i,2);
            else 
                string(i)= img(2,i,3);
            end
end
if pass == Password;
    Orignal= char(string);
    set(handles.Show,'string',Orignal)
else
    errordlg('You have Enter Worng password or anyone Layer')
end



function Show_Callback(hObject, eventdata, handles)
% hObject    handle to Show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Show as text
%        str2double(get(hObject,'String')) returns contents of Show as a double


% --- Executes during object creation, after setting all properties.
function Show_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
