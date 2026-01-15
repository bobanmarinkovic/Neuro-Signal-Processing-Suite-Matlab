function varargout = EMGprozor(varargin)
%EMGPROZOR M-file for EMGprozor.fig
%      EMGPROZOR, by itself, creates a new EMGPROZOR or raises the existing
%      singleton*.
%
%      H = EMGPROZOR returns the handle to a new EMGPROZOR or the handle to
%      the existing singleton*.
%
%      EMGPROZOR('Property','Value',...) creates a new EMGPROZOR using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to EMGprozor_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      EMGPROZOR('CALLBACK') and EMGPROZOR('CALLBACK',hObject,...) call the
%      local function named CALLBACK in EMGPROZOR.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMGprozor

% Last Modified by GUIDE v2.5 07-Jun-2023 21:14:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EMGprozor_OpeningFcn, ...
                   'gui_OutputFcn',  @EMGprozor_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before EMGprozor is made visible.
function EMGprozor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for EMGprozor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EMGprozor wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global signal t signal2 t2
load('EMG_signal1.mat');
    handles.ucitani = data;
    
    guidata(hObject, handles);
    Fs=data.Fs;
    signal=data.signal;
    
    t = 0:1/Fs:floor(length(signal)/Fs)-1/Fs;
    signal = handles.ucitani.signal;
  
    
    axes(handles.axes1);
    plot(t, signal);
    hold on;
    title('EMG signal');
    
    load('EMG_signal2.mat');
    handles.ucitani = data;
    
    guidata(hObject, handles);
    Fs=data.Fs;
    signal2=data.signal;
    
    t2 = 0:1/Fs:floor(length(signal2)/Fs)-1/Fs;
    signal2 = handles.ucitani.signal;
  
    
    axes(handles.axes2);
    plot(t, signal2);
    hold on
    title('EMG signal');

% --- Outputs from this function are returned to the command line.
function varargout = EMGprozor_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal t signal2 t2
[b,a] = butter(2,0.005,'low');  %nf filtar drugog reda 

[H,w] = freqz(b,a,2000); %n=2, Wn = 0.005, N = 2000 broj tacaka u kojem prikazujemo


filtrirani_signal = filter(b,a,sqrt((signal.*signal)));
anvelopa1 = filtrirani_signal;
axes(handles.axes1);
plot(t, anvelopa1, 'r')

[b,a] = butter(2,0.009,'low');  %nf filtar drugog reda 

[H,w] = freqz(b,a,2000); %n=2, Wn = 0.005, N = 2000 broj tacaka u kojem prikazujemo


filtrirani_signal = filter(b,a,sqrt((signal2.*signal2)));
anvelopa2 = filtrirani_signal;
axes(handles.axes2);
plot(t2, anvelopa2, 'r')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Parametri
global signal t signal2 t2
amplitude_threshold = 1.5; % Prag za detekciju promena amplitude
flexion_threshold = 0.5; % Prag za fleksiju mi?i?a (pretpostavka: ve?a amplituda)
extension_threshold = -0.5; % Prag za ekstenziju mi?i?a (pretpostavka: manja amplituda)

% Odre?ivanje trenutaka fleksije
flexion_indices = find(signal > amplitude_threshold); % Pronala?enje indeksa gde se prelazi prag amplitude za fleksiju

% Odre?ivanje trenutaka ekstenzije
extension_indices = find(signal2 > 2); % Pronala?enje indeksa gde se prelazi prag amplitude za ekstenziju

% Prikaz rezultata

axes(handles.axes1)
plot(t,signal)
hold on;
plot(flexion_indices, signal(flexion_indices), 'ro', 'MarkerSize', 2);

title('EMG signal');
xlabel('Vreme');
ylabel('Amplituda');
legend('EMG signal', 'Fleksija');
grid on;

axes(handles.axes2)
plot(t2,signal2)
hold on


plot(extension_indices, signal2(extension_indices), 'go', 'MarkerSize', 4);
title('EMG signal');
xlabel('Vreme');
ylabel('Amplituda');
legend('EMG signal',  'Ekstenzija');
grid on;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
text(0.8,-1, 'Fleksija', 'Color', 'Black');
text(6.8,-1, 'Fleksija', 'Color', 'Black');
text(11.5,-1, 'Fleksija', 'Color', 'Black');

axes(handles.axes2);
text(3.3,-1, 'Ekstenzija', 'Color', 'Black');
text(9.2,-1, 'Ekstenzija', 'Color', 'Black');
text(13.5,-1, 'Ekstenzija', 'Color', 'Black');
