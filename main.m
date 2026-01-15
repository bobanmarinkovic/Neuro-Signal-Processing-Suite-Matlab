
function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 07-Jun-2023 17:29:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Signal1.
function Signal1_Callback(hObject, eventdata, handles)
global x;
% hObject    handle to Signal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Signal1

x=1;

function Signal2_Callback(hObject, eventdata, handles)
% hObject    handle to Signal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Signal2

global x;

x=2;
function Signal3_Callback(hObject, eventdata, handles)
% hObject    handle to Signal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Signal2

global x;

x=3;


function pushbutton1_Callback(hObject, eventdata, handles)
global x;
global t;
global signal;
global odabir_zuma;
odabir_zuma=0;
global Fs;
if x==1
    load('EMG_signal1.mat');
    handles.ucitani = data;
    
    guidata(hObject, handles);
    Fs=data.Fs;
    signal=data.signal;
    
    t = 0:1/Fs:floor(length(signal)/Fs)-1/Fs;
    signal = handles.ucitani.signal;
  
    
    axes(handles.axes1);
    plot(t, signal);
    title('EMG signal');
    
elseif x==2
    load('EMG_signal2.mat');
    handles.ucitani = data;
   
    guidata(hObject, handles);
    Fs=data.Fs;
    signal2=data.signal;
    t = 0:1/Fs:floor(length(signal2)/Fs)-1/Fs;
    signal = handles.ucitani.signal;
    axes(handles.axes1);
    plot(t, signal);
    title('EMG signal');
elseif x==3
   
    signal3 = load('EMG_signal3.mat');
    s3 = signal3.data.EMG;
    Fs = signal3.data.Fs;
    t = 0:1/Fs:((length(s3)-1)/Fs);
  
    axes(handles.axes1);
    plot(t, s3);
    title('EMG signal');
    
    signal4 = load('EEG.mat');
    s4 = signal4.data.EEG;
    Fs = signal4.data.Fs;
    t = 0:1/Fs:((length(s4)-1)/Fs);
    
    axes(handles.axes2);
    plot(t, s4);
    title('EEG signal');
    
    
end



% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
global odabir_zuma;
odabir_zuma=1
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
global odabir_zuma;
odabir_zuma=2
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
% --- Executes on button press in Zoom.
function Zoom_Callback(hObject, eventdata, handles)
global odabir_zuma;
global t;
global signal;
global z;

if odabir_zuma==1
    [x,y] = ginput(2)
    x_kvadrat = [x(1) x(1) x(2) x(2) x(1)] ;
    y_kvadrat = [y(1) y(2) y(2) y(1) y(1)] ;
    hold on  
    axes(handles.axes1)
    plot(x_kvadrat, y_kvadrat, 'r')
    hold off   

    donja = x(1);
    gornja = x(2);

    indeksi = t >= donja & t<=gornja;
    handles.t_select = t(indeksi);                
    handles.signal_select = signal(indeksi);      
    guidata(hObject, handles);

    axes(handles.axes2)
    plot(handles.t_select, handles.signal_select);
    xlim([min(handles.t_select) max(handles.t_select)])
    ylim([min(y) max(y)]) 
    
    

elseif odabir_zuma==2
     [x,y] = ginput(2)
    
    r = sqrt((x(1)-x(2))^2+(y(1)-y(2))^2);
    w = 0:0.01:2*3.14;
    x = r*cos(w) + x(1);
    y = r*sin(w) + y(1);
    
    
    hold on  
    axes(handles.axes1)
    plot(x, y, 'r')
    hold off
    
    
    indeksi = t >= (x(1)-2*r) & t <= (x(1));
    indeksi = t >= (y(1)-2*r) & t <= (y(1))
    handles.t_select = t(indeksi);                 
    handles.signal_select = signal(indeksi);       
    guidata(hObject, handles);
    
    disp(handles.signal_select)
    for i=handles.t_select
        if i>r
            i=0;
        else
            disp(i)
            
        end
    end

    axes(handles.axes2)
    plot(handles.t_select, handles.signal_select);
    xlim([min(handles.t_select) max(handles.t_select)])
    ylim([min(y) max(y)])
   
end
z=1


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global z;
global data;
if z==1
    s=handles.signal_select

    vr=handles.t_select

    Fs1=round(1/(vr(2)-vr(1)))
    ime=get(handles.edit1,'String')
    data.signal=s;
    data.Fs=Fs1;
    data.t=vr;
    
    save(ime,'data')
    cla(handles.axes2)
    z=0;
else 
    msgbox('NIJE IZVRSENA FUNKCIJA ZUMIRANJA!')

end
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;

global f;
global signal;
global t;
global Fs;
global x;
global datai;
global cuvanje;
if x==1
    load('signal1.mat');
    handles.ucitani = data;
    data
    guidata(hObject, handles);
    Fs=data.Fs;
    signal=data.signal;
  
    t = 0:1/Fs:floor(length(signal)/Fs);
    signal = handles.ucitani.signal;
    disp(length(t))
    disp(1/Fs)
   
    
    
elseif x==2
    load('signal2.mat');
    handles.ucitani = data;
   
    guidata(hObject, handles);
    Fs=data.Fs;
    signal2=data.signal;
    t = 0:1/Fs:floor(length(signal2)/Fs);
    signal = handles.ucitani.signal;
  
    
elseif x==3
    load('signal3.mat');
    handles.ucitani = data;
   
    guidata(hObject, handles);
    Fs=data.Fs;
    signal3=data.signal;
    t = 0:1/Fs:floor(length(signal3)/Fs);
    signal = handles.ucitani.signal;
   
    
    
end
if f == 1
    uiwait(Tipfiltra)
    datai.tipfiltra
    if cuvanje==0
        if datai.tipfiltra=='NF'
            
            b=[1, -2*data.rn*cos(data.un), data.rn^2];
            a=[1, -2*data.rp*cos(data.up), data.rp^2];
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            disp(f_osa_pola)
            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif datai.tipfiltra=='VF'

            b=[1, -2*data.rn*cos(data.un), data.rn^2];
            a=[1, -2*data.rp*cos(data.up), data.rp^2];
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif datai.tipfiltra=='BP'
            disp('AAAAAAA')
            b=conv([1, -2*data.rn*cos(data.un1), data.rn^2],[1, -2*data.rn*cos(data.un2), data.rn^2]);
            a=conv([1, -2*data.rp*cos(data.up1), data.rp^2], [1,-2*data.rp*cos(data.up2), data.rp^2]);
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif datai.tipfiltra=='BS'

            b=conv([1, -2*data.rn*cos(data.un1), data.rn^2],[1, -2*data.rn*cos(data.un2), data.rn^2]);
            a=conv([1, -2*data.rp*cos(data.up1), data.rp^2], [1,-2*data.rp*cos(data.up2), data.rp^2]);
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')

        end
    end
    
elseif f==2
    uiwait(Tipfiltra)
    fs=100;
    if cuvanje==0
        if datai.tipfiltra=='NF'
            data.Fp
            data.Fa
            Wp=data.Fp*2/fs
            Wa=data.Fa*2/fs
            
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'low');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='VF'
            Wp=data.Fp*2/fs;
            Wa=data.Fa*2/fs;
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'high');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BP'
            Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
            Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'bandpass');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BS'
             Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
             Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'stop');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(f,20*log10(abs(H)));
        end
    end
elseif f==3
     uiwait(Tipfiltra)
    fs=100;
    if cuvanje==0
        if datai.tipfiltra=='NF'
            data.Fp
            data.Fa
            Wp=data.Fp*2/fs
            Wa=data.Fa*2/fs
            
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'low');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='VF'
            Wp=data.Fp*2/fs;
            Wa=data.Fa*2/fs;
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'high');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BP'
            Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
            Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'bandpass');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BS'
             Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
             Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'stop');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(f,20*log10(abs(H)));
        end
    end
else
    msgbox('Niste odabrali tip filtra!')
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data;

global signal;
global t;
global Fs;
global x;


if x==1
    load('signal1.mat')
    handles.ucitani = data;
    data
    guidata(hObject, handles);
    Fs=data.Fs;
    signal=data.signal;
  
    t = 0:1/Fs:floor(length(signal)/Fs);
    signal = handles.ucitani.signal;
    
    
    
elseif x==2
    load('signal2.mat');
    handles.ucitani = data;
   
    guidata(hObject, handles);
    Fs=data.Fs;
    signal2=data.signal;
    t = 0:1/Fs:floor(length(signal2)/Fs);
    signal = handles.ucitani.signal;
  
    
elseif x==3
    load('signal3.mat');
    handles.ucitani = data;
   
    guidata(hObject, handles);
    Fs=data.Fs;
    signal3=data.signal;
    t = 0:1/Fs:floor(length(signal3)/Fs);
    signal = handles.ucitani.signal;
end
str=get(handles.edit2,'String')
filtar_u=char(str)
load(filtar_u)   
if data.tip == 1

    
        if data.tipfiltra=='NF'

            b=[1, -2*data.rn*cos(data.un), data.rn^2];
            a=[1, -2*data.rp*cos(data.up), data.rp^2];
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            disp(f_osa_pola)
            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif data.tipfiltra=='VF'

            b=[1, -2*data.rn*cos(data.un), data.rn^2];
            a=[1, -2*data.rp*cos(data.up), data.rp^2];
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif data.tipfiltra=='BP'
            disp('AAAAAAA')
            b=conv([1, -2*data.rn*cos(data.un1), data.rn^2],[1, -2*data.rn*cos(data.un2), data.rn^2]);
            a=conv([1, -2*data.rp*cos(data.up1), data.rp^2], [1,-2*data.rp*cos(data.up2), data.rp^2]);
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')
        elseif data.tipfiltra=='BS'

            b=conv([1, -2*data.rn*cos(data.un1), data.rn^2],[1, -2*data.rn*cos(data.un2), data.rn^2]);
            a=conv([1, -2*data.rp*cos(data.up1), data.rp^2], [1,-2*data.rp*cos(data.up2), data.rp^2]);
            y=filter(b,a,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')

            [H,w]=freqz(b,a,length(f_osa_pola));

            axes(handles.axes3)
            plot(f_osa_pola,abs(H))
            title('ampl spek filtra')
            ylabel('frek')

        end
    
    
elseif data.tip==2
    fs=100;
    if data.tipfiltra=='NF'
            data.Fp
            data.Fa
            Wp=data.Fp*2/fs
            Wa=data.Fa*2/fs
            
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'low');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='VF'
            Wp=data.Fp*2/fs;
            Wa=data.Fa*2/fs;
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'high');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BP'
            Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
            Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'bandpass');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif datai.tipfiltra=='BS'
             Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
             Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=buttord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=butter(n,Wn, 'stop');
            [H,w]=freqz(P,Q,500);
             y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(f,20*log10(abs(H)));
        end
elseif data.tip==3
    fs=100;
    if data.tipfiltra=='NF'
            data.Fp
            data.Fa
            Wp=data.Fp*2/fs
            Wa=data.Fa*2/fs
            
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'low');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif data.tipfiltra=='VF'
            Wp=data.Fp*2/fs;
            Wa=data.Fa*2/fs;
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'high');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif data.tipfiltra=='BP'
            Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
            Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,Wn, 'bandpass');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(fr,20*log10(abs(H)));
        elseif data.tipfiltra=='BS'
             Wp=[(data.Fp1)*2/fs (data.Fp2)*2/fs];
             Wa=[(data.Fa1)*2/fs (data.Fa2)*2/fs];
            [n,Wn]=cheb1ord(Wp,Wa,data.Rp,data.Rs);
            [P,Q]=cheby1(n,data.Rp,Wn, 'stop');
            [H,w]=freqz(P,Q,500);
            y=filter(P,Q,signal);
            S1=fft(signal);
            S2=fft(y);

            f_osa=0:Fs/length(signal):(Fs-Fs/length(signal));
            f_osa_pola=f_osa(1:end/2);

            S1=S1(1:end/2);
            S2=S2(1:end/2);
            axes(handles.axes1)
            plot(f_osa_pola,abs(S1))
            title('ampl spek na ulazu')
            xlabel('frek')
            axes(handles.axes2)
            plot(f_osa_pola,abs(S2))
            title('ampl spek na izlazu')
            xlabel('frek')
            fr=w*fs/(2*pi);
            axes(handles.axes3)
            plot(f,20*log10(abs(H)));
        end
else
    msgbox('Niste odabrali tip filtra!')
end

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
global f;
f=1;

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
global f;
f=2;


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
global f;
f=3;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(EMGprozor)

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(EEG)
