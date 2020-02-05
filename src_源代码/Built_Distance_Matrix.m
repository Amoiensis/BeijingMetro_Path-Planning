%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Built_Distance_Matrix (构建距离矩阵)
%% Built_Distance_Matrix 构建距离矩阵
%Initial
size_station = size(stationdata);
Node_num = stationdata(size_station(1),3);
distancedata = inf(Node_num,Node_num);
size_distance_information = size(Distance_data);
%Operation
for d_i=1:size_distance_information(1)
    if (Distance_data(d_i,1)~= 0) & (Distance_data(d_i,2)~= 0)
        distancedata(Distance_data(d_i,1),Distance_data(d_i,2)) = Distance_data(d_i,3);
        distancedata(Distance_data(d_i,2),Distance_data(d_i,1)) = Distance_data(d_i,3);
    end
end
%利用 Floyd算法 （佛洛依德算法）
%问题：
% 1. 这个算法是能够精确求解的吗？还是只是用于特定的解的问题结构下的，动态规划方法。‘
% 2. 应该怎么通过Floyd算法在保留最短路结果的时候，同样将最短路径保存下来？
%     （想过采用A*1000+B）类似于编码的方式解决，但是感觉这个方法容易因为点过多，引起数据的爆炸。