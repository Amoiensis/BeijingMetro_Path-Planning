%% IMFORMATION
% Author: Xiping Yu
% Data: 2019.11.18
% Course: Operational Research
% Dtailed: Floyd Warshall (佛洛依德算法)
% Use: 用于构建 'Best Distance' and 'Last Choice'
%% IMPORT DATA
 
D = tril(distancedata,-1) + triu(distancedata,1);

% D =[...
%     0   5   2   inf;...
%     5   0   7   2;...
%     2   7   0   6;...
%     inf 2   6   0;...
%     ];
% D =[...
%     0   5   2   7   12  6   inf;...
%     5   0   7   2   7   4   10;...
%     2   7   0   6   5   4   10;...
%     7   2   6   0   3   2   8;...
%     12  7   5   3   0   1   3;...
%     6   4   4   2   1   0   4;...
%     inf 10  10  8   3   4   0];

%% OPERATION
Size_D = size(D);            
Last_D = D;
Last_Choice = zeros(Size_D);
Best_Distance = zeros(Size_D);
END_iteration = log2(Size_D(1))+1;
temp_Gap = inf(Size_D(1),1);
k = 0;
while k<END_iteration
    for i=1:Size_D(1)
        for j=1:Size_D(2)
            for n=1:Size_D(1)
                    temp_Gap(n) = Last_D(i,n) + Last_D(n,j);
            end
            [Best_Distance(i,j),temp_position] = min(temp_Gap);
            if (temp_position~=i && temp_position~=j) || Last_Choice(i,j) == 0 
                Last_Choice(i,j) = temp_position;
%             else
%                 if i == j
%                     Last_Choice(i,j) = i;
%                 end
            end
        end
    end
    if isequal(Last_D,Best_Distance)
        break;
    else
        Last_D = Best_Distance;
    end
    k = k+1;
end