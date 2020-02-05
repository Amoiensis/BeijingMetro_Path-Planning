%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Find Best Route (寻找最佳路径)
%% CLEARN
% clear;clc;
%% IMPORT DATA
% load('Beijing_Metro.mat');
% load('Find_Route_V2.0.mat');
%% SETTING
% 名字搜索
Order = table2array(T_stationdata(:,4));
Station_name = table2array(T_stationdata(:,2));
Departure_Station = '安河桥北';
Destination_Station = '亦庄文化园';
Departure = Order(find(Station_name==Departure_Station));
Departure = Departure(1);
Destination = Order(find(Station_name==Destination_Station));
Destination = Destination(1);
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
disp('最短线路规划为：')
Table_position = zeros(1,Size_Route(2));
for i=1:Size_Route(2)
    table_position = find(Order==Route(i));
    Table_position(i) = table_position(1);
    ROUTE(i,:) = Station_name(table_position(1));
end
disp(ROUTE);