%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Beijing Metro (Æô¶¯ÎÄ¼þ)
%% Data
load('initial.mat');
Built_Distance_Matrix;
Build_adjacent_matrix;
Floyd_Warshall;
%% Find_BestRoute;
Plot_map;
save('Find_Route_v2.1.mat','Best_Distance','Last_Choice','Station_information','T_stationdata','Station_name','Order');
save('Find_Route_plot_v2.1.mat','Position_LonLat','Route_num');
clear;
Subway_Visual;
