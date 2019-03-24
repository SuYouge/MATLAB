% TSP模拟退火算法
clear
    clc
    a = 0.99;       %温度衰减函数的参数
    t0 = 97;        %初始温度
    tf = 3;         %终止温度
    t = t0;
    Markov_length = 10000;  %Markov链长度
load('border_1.mat','centersBright','x','y');
plot(x,y,'bo');
coordinates = centersBright;
%coordinates(:,1) = [];
amount = size(coordinates,1);        %城市的数目
%通过向量化的方法计算距离矩阵
dist_matrix = zeros(amount,amount);
coor_x_tmp1 = coordinates(:,1) * ones(1,amount);
coor_x_tmp2 = coor_x_tmp1';
coor_y_tmp1 = coordinates(:,2) * ones(1,amount);
coor_y_tmp2 = coor_y_tmp1';
dist_matrix = sqrt((coor_x_tmp1 - coor_x_tmp2).^2 + (coor_y_tmp1 - coor_y_tmp2).^2);

sol_new = 1:amount;         %产生初始解，sol_new是每次产生的新解
sol_current = sol_new;      %sol_current是当前解
sol_best = sol_new;         %sol_best是冷却中的最好解
E_current = inf;            %E_current是当前解对应的回路距离
E_best = inf;               %E_best是最优解
p = 1;

while t >= tf
   for r = 1:Markov_length      %Markov链长度
    %产生随机扰动
    if(rand < 0.5)
        %两交换
        ind1 = 0;
        ind2 = 0;
        while(ind1 == ind2)
           ind1 = ceil(rand * amount);
           ind2 = ceil(rand * amount);
        end
        tmp1 = sol_new(ind1);
        sol_new(ind1) = sol_new(ind2);
        sol_new(ind2) = tmp1;
    else
        %三交换
        ind1 = 0;
        ind2 = 0;
        ind3 = 0;
        while( (ind1 == ind2) || (ind1 == ind3) || (ind2 == ind3) || (abs(ind1 -ind2) == 1) )
            ind1 = ceil(rand * amount);
            ind2 = ceil(rand * amount);
            ind3 = ceil(rand * amount);
        end
        tmp1 = ind1;
        tmp2 = ind2;
        tmp3 = ind3;
        %确保 ind1 < ind2 < ind3
        if(ind1 < ind2) && (ind2 < ind3);
        elseif(ind1 < ind3) && (ind3 < ind2)
            ind1 = tmp1; ind2 = tmp3; ind3 = tmp2;
        elseif(ind2 < ind1) && (ind1 < ind3)
            ind1 = tmp2; ind2 = tmp1; ind3 = tmp3;
        elseif(ind2 < ind3) && (ind3 < ind1)
            ind1 = tmp2; ind2 = tmp3; ind3 = tmp1;
        elseif(ind3 < ind1) && (ind1 < ind2)
            ind1 = tmp3; ind2 = tmp1; ind3 = tmp2;
        elseif(ind3 < ind2) && (ind2 < ind1)
            ind1 = tmp3; ind2 = tmp2; ind3 = tmp1;
        end
        
        tmplist1 = sol_new((ind1 + 1):(ind2 - 1));
        sol_new((ind1 + 1):(ind1 + (ind3 - ind2 + 1) )) = sol_new((ind2):(ind3));
        sol_new((ind1 + (ind3 - ind2 + 1) + 1):(ind3)) = tmplist1;
    end
    
    %检查是否满足约束
    
    %计算目标函数值（即内能）
    E_new = 0;
    for i = 1:(amount - 1)
        E_new = E_new + dist_matrix(sol_new(i),sol_new(i + 1));
    end
    %再算上从最后一个城市到第一个城市的距离
    E_new = E_new + dist_matrix(sol_new(amount),sol_new(1));
    
    if E_new < E_current
        E_current = E_new;
        sol_current = sol_new;
        if E_new < E_best
            E_best = E_new;
            sol_best = sol_new;
        end
    else
        %若新解的目标函数值大于当前解，
        %则仅以一定概率接受新解
        if rand < exp(-(E_new - E_current) / t)
            E_current = E_new;
            sol_current = sol_new;
        else
            sol_new = sol_current;
        end
        
    end
   end

   t = t * a;      %控制参数t（温度）减少为原来的a倍
end

disp('最优解为:');
disp(sol_best);
disp('最短距离:');
disp(E_best);
hold on;
%绘制最优解
N = length(sol_best);
C = coordinates;
scatter(C(:,1),C(:,2));
hold on
plot([C(sol_best(1),1),C(sol_best(N),1)],[C(sol_best(1),2),C(sol_best(N),2)],'g')
hold on
for ii=2:N
    plot([C(sol_best(ii-1),1),C(sol_best(ii),1)],[C(sol_best(ii-1),2),C(sol_best(ii),2)],'g')
    hold on
end
title('旅行商问题优化结果 ')