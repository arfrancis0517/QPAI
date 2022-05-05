clear all;
clc;
close all;

a_H2O_50_690 = 0.664;
a_H2O_50_730 = 0.388;
a_THF_50_690 = 1.316;
a_THF_50_730 = 0.646;
a_H2O_100_690 = 1.032;
a_H2O_100_730 = 0.558;
a_THF_100_690 = 1.695;
a_THF_100_730 = 0.938;

a_H2O_25_690 = 0.399;
a_H2O_25_730 = 0.179;
a_THF_25_690 = 0.273;
a_THF_25_730 = 0.099;

% H2O 50% 1mg/ml pump 690 probe 730
x = 0:100;
tr = [10 15.8 25 31.6 39.8 50 63 100];
ppH2O_100 = [0.033 0.0472 0.066 0.073 0.086 0.119 0.1475 0.2275];
ppH2O_100 = ppH2O_100./(a_H2O_100_690+a_H2O_100_730);
% norm_ppH2O_100 = ppH2O_100./max(ppH2O_100);
p1 =      0.001459;
e_H100=p1*x;


ppH2O_50 = [0.0334 0.043 0.123 0.147 0.215 0.623 0.90 1.863];
ppH2O_50 = ppH2O_50./(a_H2O_50_690+a_H2O_50_730);
% norm_ppH2O_50 = ppH2O_50./max(ppH2O_50);
% ppH2O_50 = ppH2O_50./(a_H2O_50_690+a_H2O_50_730);
% fo = fitoptions('Method','NonlinearLeastSquares',...
%                'Lower',[0,0],...
%                'StartPoint',[1 1]);
% ft = fittype('a*x^2+b','options',fo);
% 
% [curve1,gof1] = fit(tr', ppH2O_50', ft)
% a =   0.0002177;
% b =    0.01333;
% x = 0:100;
% e1=a*x.^2+b;
a =  0.0003696;
b =      1.844;
e1=a*x.^b;
% norm_ppH2O_50 = ppH2O_50./max(ppH2O_50);
% norm_e1 = (e1-min(e1))./(max(e1)-min(e1));
% plot(tr, norm_ppH2O_50, x,norm_e1)

% ppH2O_50_01 = [0.0076 0.0161 0.0434 0.0615 0.406 0.7509 2.094];
% tr_01 = [10 15.8 25 31.6 50 63 100];
% ppH2O_100 = ppH2O_100./(a_H2O_100_690+a_H2O_100_730);
% [curve2,gof2] = fit(tr',ppH2O_100','poly1')
% tr1 = [0 3.2 10 15.8 25 31.6 50 63.1 100];
% e2 = 0.0002005*tr1 + 0.001365;
ppTHF_50 = [0.034 0.0532 0.0675 0.0755 0.0825 0.114 0.154 0.306];
ppTHF_50 = ppTHF_50./(a_THF_50_690+a_THF_50_730);
% norm_ppTHF_50 = ppTHF_50./max(ppTHF_50);
a3 =   0.001388;% 0.0005289;
% b3 =        1.227;
e_T50=a3*x;
% ppTHF_50 = ppTHF_50./(a_THF_50_690+a_THF_50_730);
% [curve3,gof3] = fit(tr',ppTHF_50','poly1')
% tr1 = [0 3.2 10 15.8 25 31.6 50 63.1 100];
% e3 = 0.0001695*tr1 + 0.001609;
% yyaxis right
% ylim([0.000 0.025])
ppTHF_100 = [0.073 0.111 0.169 0.175 0.217 0.325 0.403 0.658];
ppTHF_100 = ppTHF_100./(a_THF_100_690+a_THF_100_730);
% norm_ppTHF_100 = ppTHF_100./max(ppTHF_100);
p3 =     0.002433;
e_T100=p3*x;

ppTHF_25 = [0.007 0.009 0.014 0.015 0.019 0.023 0.027 0.042];
ppTHF_25 = ppTHF_25./(a_THF_25_690+a_THF_25_730);
% norm_ppTHF_25 = ppTHF_25./max(ppTHF_25);
p4 = 0.001187;
e_T25=p4*x;

ppH2O_25 = [0.012 0.015 0.045 0.075 0.112 0.183 0.335 0.941];
ppH2O_25 = ppH2O_25./(a_H2O_25_690+a_H2O_25_730);
% [curve2,gof2] = fit(tr', ppH2O_25', ft)
a2 =     4.541e-05;
b2 =       2.277;
e2=a2*x.^b2;
% norm_ppH2O_25 = ppH2O_25./max(ppH2O_25);
% norm_e2 = (e2 - min(e2))./(max(e2) - min(e2));

fig=figure;
left_color = [1 0 0];
right_color =[0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

yyaxis left
plot(tr, ppH2O_50,'x', x,e1,tr,ppH2O_25,'s',x, e2,'LineWidth',3)

xlim([0 110])
xticks([0 25 50 75 100])
xticklabels({'0','5.33','10.66','15.99','21.32'})
% ylim([0.0 1.1])
% title('Plots with Different y-Scales')
xlabel('Fluence (mJ/cm^2)')
ylabel('PA Peak to Peak Amplitude (V)')
hold on
yyaxis right
plot(tr,ppH2O_100,'o',x, e_H100,'LineWidth',3)
plot(tr,ppTHF_100,'o',x, e_T100,tr,ppTHF_50,'x',x, e_T50, tr,ppTHF_25,'s',x, e_T25,'LineWidth',3)
ylabel('PA Peak to Peak Amplitude (V)')
legend({'SCNP_{Water}A_{50}C_{50}',' Fitted power law function',...
        'SCNP_{Water}A_{75}C_{25}',' Fitted power law function',...
        'SCNP_{Water}C_{100}','Fitted linear function',...
        'SCNP_{THF}C_{100}', 'Fitted linear function',...
        'SCNP_{THF}A_{50}C_{50}', 'Fitted linear function',...
        'SCNP_{THF}A_{75}C_{25}', 'Fitted linear function'},'Location','northwest')
set(gca,'FontSize',20)
hold off