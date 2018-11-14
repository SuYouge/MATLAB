syms xt
% xt=-10:0.1:10;
yt=(1-power(xt,2)).*exp(-0.5*(power(xt,2)));
figure(1);
ezplot(yt,[-5,6]);
hold on
% a=1.5;b=2;
syms a b;
% xt1=-10:0.1:10;
% yt1=power(abs(a),2)*(1-power(((xt1-b)/a),2)).*exp(-0.5*(power(((xt1-b)/a),2)));
yt1=power(abs(1.5),2)*(1-power(((xt-2)/1.5),2)).*exp(-0.5*(power(((xt-2)/1.5),2)));
ezplot(yt1);
figure(2)
ezplot(abs(fourier(yt)));
hold on;
F1=fourier(yt1);
ezplot(abs(F1),[0,5]);
%marrÐ¡²¨µÄÆµÓò±ä»»
% syms xw
% xw=0:0.1:5;
% yw=power(2*pi,0.5)*power(xw,2).*exp(-0.5*(power(xw,2)));
% F=fourier(yw);
% figure(2);
% ezplot(F);