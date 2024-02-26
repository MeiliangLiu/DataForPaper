
% resultFile = 'E:\newdata\eyeopen-exp-day7.mat';
% resultFile2 = 'E:\newdata\eyeopen-control-day7.mat';


resultFile = 'E:\eyeclose-aec-exp-day7.mat';
resultFile2 = 'E:\eyeclose-aec-exp-day1.mat';

% resultFile = 'E:\eyeclose-aec-exp-day7.mat';
% resultFile2 = 'E:\eyeclose-aec-exp-day1.mat';

loadedData1 = load(resultFile);
loadedData2 = load(resultFile2);
Matrix1 = loadedData1.unnamed;
Matrix2 = loadedData2.unnamed;


count=0;

sum_a=zeros(1275,1);
sum_b=zeros(1275,1);

for i = 1:1275
    for j = 1:8
        sum_a(i,1)= sum_a(i,1)+ Matrix1(i,j);
        sum_b(i,1)= sum_b(i,1)+ Matrix2(i,j);
    end

end



for i = 1:1275
  Vector1 = Matrix1(i,:);
  Vector2 = Matrix2(i,:);

  [p, h, stats] = signrank(Vector1, Vector2);

  d(i)=p;

end


[FDR, Q]=mafdr(d);
% FDR=mafdr(d,'BHFDR', true);

for i =1:1275
    
    

    if FDR(i)<0.0185 && sum_a(i,1)>sum_b(i,1)
        c(i)=1;
        
    elseif FDR(i)<0.0185 && sum_a(i,1)<sum_b(i,1)
        c(i)=-1;

    else
        c(i)=0;
    end

end






index = 1;
for i = 1:50
    for j = 1:i
        L(i,j)=c(index);
        index = index+1;
    end
end

U = L';
U = U+L;


% for i = 1:50
%     if U(i,i)==2
%         U(i,i)=1;    
%     elseif U(i,i)==-2
%         U(i,i)=-1;
%     end
% end

for i = 1:50
    U(i,i)=0;
end

% 指定要保存的文件名（例如，myBinaryMatrix.mat）
%filename = 'Matrix.mat';

% 使用save函数保存二值矩阵为.mat文件
%save(filename, U);


% imagesc(U, [0 1]);

% 定义颜色栏的标签
% colorbar;

% 设置颜色映射为紫色(0)和黄色(1)
% colormap([121/255 110/255 168/255; 1 1 153/255]); % 使用ColorSpec规范的"m"和"y"也可以：colormap([0.75 0 0.75; 1 1 0]);
%colormap([1 1 1; 8/255,48/255,107/255]);

% 可以添加标题和其他标签，以便更好地理解图形
%title('Binary Matrix with Purple (0) and Yellow (1)');

% 如果需要更改坐标轴的标签，可以使用以下命令
% xlabel('X-axis Label');
% ylabel('Y-axis Label');

% 如果需要将坐标轴标签放在特定位置，可以使用以下命令
% set(gca, 'XTick', [1 2 3 4]);
% set(gca, 'YTick', [1 2 3 4]);


% 设置颜色映射
colormap([1 0 0; 1 1 1; 0 0 1]); % 红色表示-1，白色表示0，蓝色表示1

% 使用imagesc函数绘制矩阵
imagesc(U);

% 添加颜色条
colorbar;

% 设置坐标轴标签
xlabel('列');
ylabel('行');

% 设置图标题
title('矩阵可视化');

% 调整坐标轴
axis equal;
axis tight;

