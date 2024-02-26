clc;clear
%%%%%%%%%%%%%%%%%%%%%%%%%%测试数据导入%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loadedData=load('D:\brainstorm-db\Protocol01\data\eyeopen\s1-0520\timefreq_connectn_henv_231019_1214.mat');


struct_fields = fieldnames(loadedData);
disp(struct_fields);
connectMatrix = loadedData.TF;
col3 = connectMatrix(:,1,3);
L = zeros(50);
index = 1;
for i = 1:50
    for j = 1:i
        L(i,j)=col3(index);
        index = index+1;
    end
end
U = L';
result = U+L;
A = diag(diag(result));
result = result -A;

FC_1=result;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：C=clustering_coef_wu(W)
% 用途：有权无向网络的聚类系数
% 输入：
%   (W):有权无向矩阵
% 输出：
%   (C)：聚类系数(cluster coefficient)
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
clustering_coef_wu = clustering_coef_wu(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：[C_pos,C_neg,Ctot_pos,Ctot_neg] = clustering_coef_wu_sign(W,coef_type)
% 用途：计算有权无向网络的聚类系数(包括3中不同定义)
% 输入：
%   (W):有权无向矩阵
%   (coef_type):聚类系数类型，1代表原始公式，2代表考虑权重的公式，3代表2中公式的推广
% 输出：
%   (C_pos/C_neg):正/负聚类向量，对于3只输出一个向量C_pos
%   (Ctot_pos/Ctot_neg):正/负权的平均聚类系数,对于3只输出Ctot_pos
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
[C_pos,C_neg,Ctot_pos,Ctot_neg] = clustering_coef_wu_sign(A,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：[lambda,efficiency,ecc,radius,diameter] = charpath(D,diagonal_dist,infinite_dist)
% 几种使用格式：
%   lambda                                  = charpath(D);
%   lambda                                  = charpath(D);
%   [lambda,efficiency]                     = charpath(D);
%   [lambda,efficiency,ecc,radius,diameter] = charpath(D,diagonal_dist,infinite_dist);
% 用途：计算特征路径长度，全局效率及相关统计参数
% 输入：
%   (D):距离矩阵
%   解释：输入距离矩阵可以通过任何距离函数获得，例如distance_bin, distance_wei
%   (diagonal_dist):计算中包括主对角线的距离，默认为0
%   (infinite_dist):在计算中包含无限的距离，默认为1
% 输出：
%   (lambda)：网络特征路径长度
%   (efficiency)：网络全局效率
%   (ecc)：节点离心率
%   (radius)：网络半径
%   (diameter)：网络直径
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
A = inv(A);
[A,B] = distance_wei(A);  %计算加权网络的最短路径矩阵
charpath = charpath(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：[D,B]=distance_wei(L)
% 几种使用格式：
%   D = distance_wei(L);
%   [D,B] = distance_wei(L);
% 用途：距离矩阵包含所有节点对之间最短路径的长度。
%       其中(u,v)表示从节点u到节点v的最短路径长度，
%       平均最短路径长度是网络的特征路径长度。
% 输入：
%   (L):加权或无权的长度矩阵
% 输出：
%   (D):距离(最短加权路径)矩阵
%   (B):最短加权路径矩阵中的边数
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
A = inv(A);
[distance_wei1,distance_wei2] = distance_wei(A);  %计算加权网络的最短路径矩阵
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：[SPL,hops,Pmat] = distance_wei_floyd(D,transform)
% 用途：计算连接网络中每对节点的最短可能路径的拓扑长度。
% 输入：
%   (D):加权/非加权有向/无向连接*权重* OR *长度*矩阵。
%   (transform):如果输入矩阵是连接*权重*矩阵，则指定将输入连接权重映射到
%   连接长度的转换。有两个转换可用。
%   'log' -> l_ij = -log(w_ij)
%   'inv' -> l_ij = 1/w_ij
%   如果输入矩阵是连接*长度*矩阵，则不指定转换(或指定空转换参数)。
% 输出：
%   (SPL):无加权/加权最短路径长度矩阵。如果是有向矩阵，则SPL是不对称的。
%   (hops):最短路径矩阵中的边数。如果未加权，则SPL和hops相同。
%   (Pmat):这个矩阵的元素[i,j]表示i和j之间最短路径的下一个节点。
%   这个矩阵被用作函数'retrieve_shortest_path的输入参数M '，
%   它返回由给定节点对之间最短路径组成的节点序列作为输出。
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
% A = inv(A);  %可以使用外部求逆得长度矩阵，也可以使用函数中的inv或log
[distance_wei_floyd_SPL,distance_wei_floyd_hops,distance_wei_floyd_Pmat] = distance_wei_floyd(A,'inv');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 函数：E = efficiency_wei(W, local)
% 用途：计算有权网络的全局效率和局部效率
% 几种使用格式：
%   Eglob = efficiency_wei(W);      全局
%   Eloc = efficiency_wei(W,2);     局部
% 输入：
%   (W):加权有向或无向连接矩阵
%   (local):0为全局效率（默认），1为局部效率的原始版，2为局部效率的改进版
% 输出：
%   (E)：全局/局部效率
%%%%%%ex%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = FC_1;
efficiency_wei = efficiency_wei(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

