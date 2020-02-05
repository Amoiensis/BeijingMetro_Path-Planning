function varargout = Subway_Visual(varargin)
% SUBWAY_VISUAL MATLAB code for Subway_Visual.fig
%      SUBWAY_VISUAL, by itself, creates a new SUBWAY_VISUAL or raises the existing
%      singleton*.
%
%      H = SUBWAY_VISUAL returns the handle to a new SUBWAY_VISUAL or the handle to
%      the existing singleton*.
%
%      SUBWAY_VISUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBWAY_VISUAL.M with the given input arguments.
%
%      SUBWAY_VISUAL('Property','Value',...) creates a new SUBWAY_VISUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Subway_Visual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Subway_Visual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Subway_Visual

% Last Modified by GUIDE v2.5 21-Nov-2019 18:04:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Subway_Visual_OpeningFcn, ...
                   'gui_OutputFcn',  @Subway_Visual_OutputFcn, ...
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


% --- Executes just before Subway_Visual is made visible.
function Subway_Visual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Subway_Visual (see VARARGIN)

% Choose default command line output for Subway_Visual
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Subway_Visual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Subway_Visual_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Departure_input_Callback(hObject, eventdata, handles)
% hObject    handle to Departure_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Departure_input as text
%        str2double(get(hObject,'String')) returns contents of Departure_input as a double


% --- Executes during object creation, after setting all properties.
function Departure_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Departure_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Destination_input_Callback(hObject, eventdata, handles)
% hObject    handle to Destination_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Destination_input as text
%        str2double(get(hObject,'String')) returns contents of Destination_input as a double


% --- Executes during object creation, after setting all properties.
function Destination_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Destination_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function ROUTE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ROUTE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Plot

% --- Executes during object creation, after setting all properties.
function Save_last_route_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Save_last_route (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in Save_last_route.
function Save_last_route_Callback(hObject, eventdata, handles)
% hObject    handle to Save_last_route (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Save_last_route

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Destination_Station = get(handles.Destination_input,'String');
    Departure_Station = get(handles.Departure_input,'String');
    Save_state = get(handles.Save_last_route,'Value');
    [~,RESULT,Table_position,Cost] = Find_BestRoute_f(Departure_Station,Destination_Station);
    Station_num = size(Table_position);
    set(handles.Pass_station_num,'String',Station_num(2));
    set(handles.Out_putcost,'String',Cost);
    set(handles.ROUTE,'String',RESULT);
    Plot_map_f(Table_position,'r-',~Save_state)

%%
    function [Route,ROUTE,Table_position,Best_cost] = Find_BestRoute_f(Departure_Station,Destination_Station)
        %UNTITLED2 此处显示有关此函数的摘要
        %   此处显示详细说明
        %% IMFORMATION
        % Author: Xiping Yu
        % Data: 2019.11.18
        % Course: Operational Research
        % Dtailed: Find Best ROUTE (寻找最佳路径)
        %% CLEARN
        % clear;clc;
        %% IMPORT DATA
        % load('Beijing_Metro.mat');
%         load('Find_Route_V2.0.mat');
        load('Find_Route_v2.1.mat');
        %% SETTING
        % 名字搜索
        % Departure_Station = '安河桥北';
        % Destination_Station = '亦庄文化园';
        Departure = Order(find(Station_name==Departure_Station));
        Departure = Departure(1);
        Destination = Order(find(Station_name==Destination_Station));
        Destination = Destination(1);
        Best_cost = Best_Distance(Departure,Destination);
        % 序号搜索
        % Departure = 242;
        % Destination = 14;
        %% OPERATION
        position_From = Departure;
        position_To = Destination;
        now_point = 1;
        Route = [position_From,position_To];
        
        ADD_NUM = -1;
        while ADD_NUM ~= 0
            Size_Route = size(Route);
            Total_Len = Size_Route(2);
            ADD_NUM = 0;
            i = 1;
            while i < Total_Len
                position_From = Route(i);
                position_To = Route(i+1);
                point_Mid = Last_Choice(position_From,position_To);
                %     Gap = abs(From_position-To_position);
                if point_Mid ~= position_To && point_Mid ~= position_From%Gap~=1 &&
                    Route = [Route(1:i),point_Mid,Route((i+1):end)];
                    ADD_NUM = ADD_NUM +1;
                    Total_Len = Total_Len +1;
                else
                    i = i+1;
                end
            end
        end
        % Station_information = sortrows(T_stationdata,4);  %排序车站号
        % Station_Name = table2array(Station_information(:,2)); %提取车站名
        % Order = table2array(Station_information(:,4));    %提取车站号
%         disp('最短线路规划为：')
        Table_position = zeros(1,Size_Route(2));
        for i=1:Size_Route(2)
            table_position = find(Order==Route(i));
            Table_position(i) = table_position(1);
            ROUTE(i,:) = Station_name(table_position(1));
        end
%         disp(ROUTE);

function [ ] = Plot_map_f(Table_position,mark_option,hold_option)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% load('Find_Route_V2.0_plot.mat');
load('Find_Route_plot_v2.1.mat');
now_position = 0;
if (hold_option)
    cla;
end
for i = 1:max(Position_LonLat(:,3))
    if Route_num(i)~= 0
        geoplot(Position_LonLat(now_position+1:now_position+Route_num(i),2),Position_LonLat(now_position+1:now_position+Route_num(i),1),'.');
        now_position = now_position + Route_num(i);
    end
    hold on
end
 geoplot(Position_LonLat(Table_position,2),Position_LonLat(Table_position,1),mark_option);
 geoplot(Position_LonLat(Table_position(end),2),Position_LonLat(Table_position(end),1),'*');
 geoplot(Position_LonLat(Table_position(1),2),Position_LonLat(Table_position(1),1),'o');
 %%


function Out_putcost_Callback(hObject, eventdata, handles)
% hObject    handle to Out_putcost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Out_putcost as text
%        str2double(get(hObject,'String')) returns contents of Out_putcost as a double


% --- Executes during object creation, after setting all properties.
function Out_putcost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Out_putcost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearplot_buttom.
function clearplot_buttom_Callback(hObject, eventdata, handles)
% hObject    handle to clearplot_buttom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;



function Pass_station_num_Callback(hObject, eventdata, handles)
% hObject    handle to Pass_station_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pass_station_num as text
%        str2double(get(hObject,'String')) returns contents of Pass_station_num as a double


% --- Executes during object creation, after setting all properties.
function Pass_station_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pass_station_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Change_button.
function Change_button_Callback(hObject, eventdata, handles)
% hObject    handle to Change_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    temp = get(handles.Destination_input,'String');
    Destination_Station = get(handles.Departure_input,'String');
    Departure_Station = temp;
    set(handles.Destination_input,'String',Destination_Station);
    set(handles.Departure_input,'String',Departure_Station);