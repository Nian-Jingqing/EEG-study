data=csvread('G:\動作データ\2018年10月\iwama3.csv',4,16);
for i=1:14
    subplot(14,1,i)
    plot(1:size(data,1),data(:,i));
end
