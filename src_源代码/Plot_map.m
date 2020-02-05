%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Plot Map (绘制地图)
%% CLEARN
% clear;clc;
%% IMPORT DATA
% load('Find_Route_V2.0_plot.mat');
%% Pre_Operate
% 构建地图相关参数
%%  重点！！！<请勿删除>
% 为后续函数准备
Station_name = table2array(Station_information(:,2));
Order = table2array(Station_information(:,4));
% 本函函数用
T_stationdata_name = table2array(Station_information(:,2)); 
% （上面）这里注意！！！ 存在设计时的缺陷
Station_Position_name = table2array(Station_Position(:,3));
T_stationdata_size = size(T_stationdata_name);
Position_LonLat = ones(T_stationdata_size(1),3).*[116.40,39.90,0];

for i=1:T_stationdata_size(1)
    position = find(Station_Position_name == T_stationdata_name(i));
    if ~isempty(position)
        Position_LonLat(i,:) =  table2array(Station_Position(position(1),4:6));
    end
end
clear T_stationdata_name Station_Position_name position;

Route_num = zeros(1,max(Position_LonLat(:,3)));
for i =1:T_stationdata_size(1)
    if Position_LonLat(i,3)~=0
        Route_num(Position_LonLat(i,3)) = Route_num(Position_LonLat(i,3)) + 1;
    end
end
%% 绘制地图
% now_position = 0;
% for i = 1:max(Position_LonLat(:,3))
%     if Route_num(i)~= 0
%         geoplot(Position_LonLat(now_position+1:now_position+Route_num(i),2),Position_LonLat(now_position+1:now_position+Route_num(i),1),'*');
%         now_position = now_position + Route_num(i);
%     end
%     hold on
% end
%  geoplot(Position_LonLat(Table_position,2),Position_LonLat(Table_position,1),'-');
