data=csvread('G:\����f�[�^\2018�N10��\iwama3.csv',4,16);
for i=1:14
    subplot(14,1,i)
    plot(1:size(data,1),data(:,i));
end
