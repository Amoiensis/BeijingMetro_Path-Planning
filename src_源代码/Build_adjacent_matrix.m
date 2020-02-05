%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Build_adjacent_matrix (构建临接矩阵)
%% 通过数据构建临接矩阵
%Caculate
Node_num = stationdata(end,3);
Adj_matrix = zeros(Node_num,Node_num);%邻接矩阵
%Operation
order = 1;
position = 0;

for i = 1:stationdata(end,1)
    if i<stationdata(end,1)
        if stationdata(i,2) == stationdata(i+1,2)
            if Adj_matrix(stationdata(i,3),stationdata(i+1,3)) == 0
                Adj_matrix(stationdata(i,3),stationdata(i+1,3)) = stationdata(i,2);
            else
                Adj_matrix(stationdata(i,3),stationdata(i+1,3)) = Adj_matrix(stationdata(i,3),stationdata(i+1,3))*100+stationdata(i,2);
            end
        end
    end
    
    if i>1
        if stationdata(i,2) == stationdata(i-1,2)
            if Adj_matrix(stationdata(i,3),stationdata(i-1,3)) == 0
                Adj_matrix(stationdata(i,3),stationdata(i-1,3)) = stationdata(i,2);
            else
                Adj_matrix(stationdata(i,3),stationdata(i-1,3)) = Adj_matrix(stationdata(i,3),stationdata(i-1,3))*100 +  stationdata(i,2);
            end
        end
    end
        
end