function varargout = EEG(varargin)
% EEG MATLAB code for EEG.fig
%      EEG, by itself, creates a new EEG or raises the existing
%      singleton*.
%
%      H = EEG returns the handle to a new EEG or the handle to
%      the existing singleton*.
%
%      EEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EEG.M with the given input arguments.
%
%      EEG('Property','Value',...) creates a new EEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EEG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EEG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EEG

% Last Modified by GUIDE v2.5 06-Jun-2023 22:02:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EEG_OpeningFcn, ...
                   'gui_OutputFcn',  @EEG_OutputFcn, ...
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


% --- Executes just before EEG is made visible.
function EEG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EEG (see VARARGIN)

% Choose default command line output for EEG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EEG wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global s1 t1 s2 t2 Fs

signal1 = load('EEG.mat');
s1 = signal1.data.EEG;
Fs = signal1.data.Fs;
t1 = 0:1/Fs:(length(s1)-1)/Fs;

signal2 = load('EMG_signal3.mat');
s2 = signal2.data.EMG;
%Fs = signal2.data.Fs; - iste su Fs
t2 = 0:1/Fs:(length(s2)-1)/Fs;

%figure;
%plot(t2,s2);


axes(handles.axes1);
plot(t1, s1);
xlabel('Time [s]');
ylabel('Amplitude [mV]');
title('EEG')

axes(handles.axes2);
plot(t2, s2);
xlabel('Time [s]');
ylabel('Amplitude [mV]');
title('EMG')


% --- Outputs from this function are returned to the command line.
function varargout = EEG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSPECTROGRAM.
function pushbuttonSPECTROGRAM_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSPECTROGRAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s1 t1 s2 t2 Fs

win = str2num(get(handles.edit1, 'String')); 
noverlap = str2num(get(handles.edit2, 'String')); 
nfft = str2num(get(handles.edit3, 'String')); 

[s_stft, f_stft, t_stft, P_stft] = spectrogram(s1, win, noverlap, nfft, Fs, 'yaxis');
%win++ -> frekv rezol++ vrem rezol-- 
%nfft ops
axes(handles.axes3);
surf(t_stft, f_stft, 10*log(P_stft))
xlabel('Vreme [s]');
ylabel('Frekvencija [Hz]');
title(['STFT'])
fmin = str2num(get(handles.edit4, 'String'));
fmax = str2num(get(handles.edit5, 'String'));
[result] = wavelet_spektrogram(s1, Fs, fmin, fmax);

[F, T] = size(result);
f_novo = linspace(fmin, fmax, F);
time_novo = linspace(t1(1), t1(end), T);

axes(handles.axes4)
imagesc(time_novo, f_novo, abs(result));
colorbar; %prikazuje opseg boja, ovo sa strane
ylabel('Frekvencija [Hz]');
xlabel('Vreme [s]');
ylim([0 fmax])
title(['Wavelet'])






function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonERD.
function pushbuttonERD_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonERD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes4);
text(5.7,15, 'ERD', 'Color', 'Black');
text(20.0,15, 'ERD', 'Color', 'Black');
text(33.3,15, 'ERD', 'Color', 'Black');
