% TSPģ���˻��㷨
clear
    clc
    a = 0.99;       %�¶�˥�������Ĳ���
    t0 = 97;        %��ʼ�¶�
    tf = 3;         %��ֹ�¶�
    t = t0;
    Markov_length = 10000;  %Markov������
load('border_1.mat','centersBright','x','y');
plot(x,y,'bo');
coordinates = centersBright;
%coordinates(:,1) = [];
amount = size(coordinates,1);        %���е���Ŀ
%ͨ���������ķ�������������
dist_matrix = zeros(amount,amount);
coor_x_tmp1 = coordinates(:,1) * ones(1,amount);
coor_x_tmp2 = coor_x_tmp1';
coor_y_tmp1 = coordinates(:,2) * ones(1,amount);
coor_y_tmp2 = coor_y_tmp1';
dist_matrix = sqrt((coor_x_tmp1 - coor_x_tmp2).^2 + (coor_y_tmp1 - coor_y_tmp2).^2);

sol_new = 1:amount;         %������ʼ�⣬sol_new��ÿ�β������½�
sol_current = sol_new;      %sol_current�ǵ�ǰ��
sol_best = sol_new;         %sol_best����ȴ�е���ý�
E_current = inf;            %E_current�ǵ�ǰ���Ӧ�Ļ�·����
E_best = inf;               %E_best�����Ž�
p = 1;

while t >= tf
   for r = 1:Markov_length      %Markov������
    %��������Ŷ�
    if(rand < 0.5)
        %������
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
        %������
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
        %ȷ�� ind1 < ind2 < ind3
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
    
    %����Ƿ�����Լ��
    
    %����Ŀ�꺯��ֵ�������ܣ�
    E_new = 0;
    for i = 1:(amount - 1)
        E_new = E_new + dist_matrix(sol_new(i),sol_new(i + 1));
    end
    %�����ϴ����һ�����е���һ�����еľ���
    E_new = E_new + dist_matrix(sol_new(amount),sol_new(1));
    
    if E_new < E_current
        E_current = E_new;
        sol_current = sol_new;
        if E_new < E_best
            E_best = E_new;
            sol_best = sol_new;
        end
    else
        %���½��Ŀ�꺯��ֵ���ڵ�ǰ�⣬
        %�����һ�����ʽ����½�
        if rand < exp(-(E_new - E_current) / t)
            E_current = E_new;
            sol_current = sol_new;
        else
            sol_new = sol_current;
        end
        
    end
   end

   t = t * a;      %���Ʋ���t���¶ȣ�����Ϊԭ����a��
end

disp('���Ž�Ϊ:');
disp(sol_best);
disp('��̾���:');
disp(E_best);
hold on;
%�������Ž�
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
title('�����������Ż���� ')