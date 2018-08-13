clc,clear
randn('state',sum(clock));
eps=randn(1,10000);
x=zeros(1,10000);
x(1)=0;
for j=2:10000
    x(j)=0.8*x(j)+eps(1)-0.4*eps(j-1);
end
var=garch(1,1);
for i=1:3
    for j=1:3
        mil=arima('ARlags',i,'MAlags',j,'Variance',var);
        [estmil,estpara,logl]=estimate(mil,x');
        num=sum(any(estpara));
        [aic,bic]=aicbic(logl,num,10000);
    end
end