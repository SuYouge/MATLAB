%遗传算法
function ga_TSP
% mainly amended by Chen Zhen, 2012~2016
figure;
CityNum=40; %you chan choose 10, 30, 50, 75
[dislist,Clist]=tsp(CityNum);
inn=40; %初始种群大小
gnmax=500;  %最大代数
pc=0.7; %交叉概率
pm=0.7; %变异概率

%产生初始种群
s=zeros(inn,CityNum);
for i=1:inn
    s(i,:)=randperm(CityNum);
end
[~,p]=objf(s,dislist);

gn=1;
ymean=zeros(gn,1);
ymax=zeros(gn,1);
xmax=zeros(inn,CityNum);
scnew=zeros(inn,CityNum);
smnew=zeros(inn,CityNum);
while gn<gnmax+1
   for j=1:2:inn
      seln=sel(p);  %选择操作
      scro=cro(s,seln,pc);  %交叉操作
      scnew(j,:)=scro(1,:);
      scnew(j+1,:)=scro(2,:);
      smnew(j,:)=mut(scnew(j,:),pm);  %变异操作
      smnew(j+1,:)=mut(scnew(j+1,:),pm);
   end
   s=smnew;  %产生了新的种群
   [f,p]=objf(s,dislist);  %计算新种群的适应度
   %记录当前代最好和平均的适应度
   [fmax,nmax]=max(f);
   ymean(gn)=1000/mean(f);
   ymax(gn)=1000/fmax;
   %记录当前代的最佳个体
   x=s(nmax,:);
   xmax(gn,:)=x;
   drawTSP(Clist,x,ymax(gn),gn,0);
   gn=gn+1;
end
[min_ymax,index]=min(ymax);
drawTSP(Clist,xmax(index,:),min_ymax,index,1);
figure;
plot(ymax,'r'); hold on;
plot(ymean,'b');grid;
title('搜索过程');
legend('最优解','平均解');
fprintf('遗传算法得到的最短距离:%.2f\n',min_ymax);
fprintf('遗传算法得到的最短路线');
disp(xmax(index,:));
end
