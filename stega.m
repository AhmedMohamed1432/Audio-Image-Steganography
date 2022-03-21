function varargout = stega(varargin)
% STEGA MATLAB code for stega.fig
%      STEGA, by itself, creates a new STEGA or raises the existing
%      singleton*.
%
%      H = STEGA returns the handle to a new STEGA or the handle to
%      the existing singleton*.
%
%      STEGA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEGA.M with the given input arguments.
%
%      STEGA('Property','Value',...) creates a new STEGA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stega_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stega_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stega

% Last Modified by GUIDE v2.5 18-Jan-2021 21:45:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stega_OpeningFcn, ...
                   'gui_OutputFcn',  @stega_OutputFcn, ...
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


% --- Executes just before stega is made visible.
function stega_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stega (see VARARGIN)

% Choose default command line output for stega
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stega wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stega_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
global filename pathname audio_data FS;
filename = '';
pathname = '';
[filename pathname]= uigetfile({'.wav'}, 'File Selector');
[audio_data, FS] = audioread(filename);
set(handles.mainaudioname, 'string' , filename);
%duration_in_seconds1 = floor(length(audio_data) / FS);
% sound (audio_data, FS);
% pause(duration_in_seconds1);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mainpush.
function mainpush_Callback(hObject, eventdata, handles)
global filename pathname audio_data FS  secret_file secretFS secret_audio_data;
global freq_factor shiftingFrequency;
if(get(handles.encodetag,'value')==1)
lpFilt1 = designfilt('lowpassfir','PassbandFrequency',17,'StopbandFrequency',22,'PassbandRipple',0.057501127785,'StopbandAttenuation',0.0001,'SampleRate',48);
main_filtered_sig = filter(lpFilt1, audio_data);
%Processing secret audio
bpFilt = designfilt('bandpassfir','FilterOrder',10,'CutoffFrequency1',17,'CutoffFrequency2',21,'SampleRate',48);
secret_filtered_sig = filter(bpFilt, secret_audio_data);
message_time = ((0:length(secret_audio_data)-1)/secretFS); 
message_time = transpose(message_time);
shiftingFrequency = 20000;
freq_factor = cos(2 * pi * shiftingFrequency * message_time); %Raising the secret message's frequency
secret_filtered_sig = secret_filtered_sig .* freq_factor;
main_audio_length = length(main_filtered_sig);
secr_audio_length = length(secret_filtered_sig);
length_diff = main_audio_length-secr_audio_length;
secret_filtered_sig = [secret_filtered_sig;zeros(length_diff,1)]; %Padding the shorter signal (The secret message) With zeros to match the main signal's length
full_signal = secret_filtered_sig + main_filtered_sig;
newfile = {'*.wav'};
[audioname, path] = uiputfile(newfile);
audiowrite(audioname,full_signal,FS);
end



if(get(handles.decodetag,'value')==1)
set(handles.hiddenpush, 'visible', 'off');
set(handles.hiddenplot, 'visible', 'off');
set(handles.hiddenplay, 'visible', 'off');
set(handles.axes2, 'visible', 'off');    
[Merged_data, FS] = audioread(filename);
extracted_secret_message = highpass(Merged_data, 18000, secretFS);
extracted_audio = lowpass(Merged_data, 17000, FS);
dec_factor = cos(2 * pi * shiftingFrequency * transpose(0:length(extracted_secret_message)-1)/secretFS);
extracted_secret_message = extracted_secret_message.*dec_factor;
extracted_secret_message = extracted_secret_message(1: length(secret_audio_data));
newfile = {'*.wav'};
[audioname, path] = uiputfile(newfile);
audiowrite(audioname,extracted_secret_message*25,secretFS);
%sound(extracted_secret_message*25, secretFS);  %Uncomment to play the extracted secret message
%pause(duration_in_seconds2);
%sound(extracted_audio, FS);                     %Uncomment to play the extracted main audio
end
% hObject    handle to mainpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global filename pathname audio_data FS;
axes(handles.axes1);
plot(audio_data);
%duration_in_seconds1 = floor(length(audio_data) / FS);
% sound (audio_data, FS);
% pause(duration_in_seconds1);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global filename pathname audio_data FS;
duration_in_seconds1 = floor(length(audio_data) / FS);
 sound (audio_data, FS);
 pause(duration_in_seconds1);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hiddenpush.
function hiddenpush_Callback(hObject, eventdata, handles)
global secret_file secretFS secret_audio_data;
[secret_file hiddenpath]= uigetfile({'.wav'}, 'File Selector');
[secret_audio_data, secretFS] = audioread(secret_file);
set(handles.hiddenaudioname, 'string' , secret_file);
%duration_in_seconds2 = floor(length(secret_audio_data) / secretFS);
% sound (secret_audio_data, secretFS);
 %pause(duration_in_seconds2);
% hObject    handle to hiddenpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in encodetag.
function encodetag_Callback(hObject, eventdata, handles)
% hObject    handle to encodetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hiddenpush, 'visible', 'on');
set(handles.hiddenplot, 'visible', 'on');
set(handles.hiddenplay, 'visible', 'on');
set(handles.axes2, 'visible', 'on');    

set(handles.mainpush , 'string' , 'Hide and Save');
% Hint: get(hObject,'Value') returns toggle state of encodetag


% --- Executes on button press in decodetag.
function decodetag_Callback(hObject, eventdata, handles)
% hObject    handle to decodetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hiddenpush, 'visible', 'off');
set(handles.hiddenplot, 'visible', 'off');
set(handles.hiddenplay, 'visible', 'off');
set(handles.axes2, 'visible', 'off');    
set(handles.mainpush , 'string' , 'Retrieve and Save');

% Hint: get(hObject,'Value') returns toggle state of decodetag


% --- Executes on button press in hiddenplot.
function hiddenplot_Callback(hObject, eventdata, handles)
global secret_file secretFS secret_audio_data;
axes(handles.axes2);
plot(secret_audio_data);
%duration_in_seconds2 = floor(length(secret_audio_data) / secretFS);
% sound (secret_audio_data, secretFS);
 %pause(duration_in_seconds2);
% hObject    handle to hiddenpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to hiddenplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hiddenplay.
function hiddenplay_Callback(hObject, eventdata, handles)
global secret_file secretFS secret_audio_data;
duration_in_seconds2 = floor(length(secret_audio_data) / secretFS);
 sound (secret_audio_data, secretFS);
 pause(duration_in_seconds2);
% hObject    handle to hiddenplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
