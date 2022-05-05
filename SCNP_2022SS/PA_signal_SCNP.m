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

a_H2O_25_690 = 0.341;
a_H2O_25_730 = 0.169;
a_THF_25_690 = 0.273;
a_THF_25_730 = 0.099;

load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_50_C_50 1mgml-1 and velocity.mat');

h0 = D0./(a_H2O_50_690+a_H2O_50_730);
h0 = h0(1000:6000);
h5 = D5./(a_H2O_50_690+a_H2O_50_730);
h5 = h5(1000:6000);
h10 = D10./(a_H2O_50_690+a_H2O_50_730);
h10 = h10(1000:6000);


load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_50_C_50 1mgml-1.mat');

t0 = D0./(a_THF_50_690+a_THF_50_730);
t0 = circshift(t0,-50);
t0 = t0(1000:6000);
t5 = D5./(a_THF_50_690+a_THF_50_730);
t5 = circshift(t5,-50);
t5 = t5(1000:6000);
t10 = D10./(a_THF_50_690+a_THF_50_730);
t10 = circshift(t10,-50);
t10 = t10(1000:6000);
x=x(1:5001)+4000;
figure
subplot(1,2,1)
% plot(x,h0,'b','LineWidth',2)
% hold on
% plot(x,h5,'c','LineWidth',2)
% plot(x,h10,'r','LineWidth',2)
% plot(x,t0,'b--','LineWidth',2)
% plot(x,t5,'c--','LineWidth',2)
% plot(x,t10,'r--','LineWidth',2)
plot(x, h0,'b',x, h5,'c',x, h10,'r',x,t0,'b--',x,t5,'c--',x,t10,'r--','LineWidth',2)
% legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','southwest')
xlabel('t (ns)')
ylabel('Absorption-normalized PAS Signal')
title('SCNP_{Water}A_{50}C_{50} and SCNP_{THF}A_{50}C_{50}')
% set(gca,'FontSize',20)
% hold off
% subplot(1,2,2);
% figure
subplot(1,2,2)
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_50_C_50 1mgml-1 and velocity.mat');
hv0 = v0./(a_H2O_50_690+a_H2O_50_730);
hv0 = hv0(1000:6000);
hv5 = v5./(a_H2O_50_690+a_H2O_50_730);
hv5 = hv5(1000:6000);
hv10 = v10./(a_H2O_50_690+a_H2O_50_730);
hv10 = hv10(1000:6000);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_50_C_50 1mgml-1 velocity potential.mat');
tv0 = D0./(a_THF_50_690+a_THF_50_730);
tv0 = circshift(tv0,-50);
tv0 = tv0(1000:6000);
tv5 = D5./(a_THF_50_690+a_THF_50_730);
tv5 = circshift(tv5,-50);
tv5 = tv5(1000:6000);
tv10 = D10./(a_THF_50_690+a_THF_50_730);
tv10 = circshift(tv10,-50);
tv10 = tv10(1000:6000);
x=x(1:5001)+4000;
plot(x, hv0,'b',x, hv5,'c',x, hv10,'r',x,tv0,'b--',x,tv5,'c--',x,tv10,'r--','LineWidth',2)
xlabel('t (ns)')
ylabel('Absorption-normalized PAS Velocity Potential')
title('SCNP_{Water}A_{50}C_{50} and SCNP_{THF}A_{50}C_{50}')
legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','northwest')
% set(gca,'FontSize',20)

figure

sp_hand2 = subplot(2,3,2);
plot(x, h0,'b',x, h5,'c',x, h10,'r','LineWidth',1)
legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns'},'Location','southwest')
hold on
plot(x,t0,'b--',x,t5,'c--',x,t10,'r--','LineWidth',1)
hold off
xlabel('time (ns)')
%ylabel('Absorption-normalized PAS Signal')
title('SCNP_{Water}A_{50}C_{50} vs. SCNP_{THF}A_{50}C_{50}')
%legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','southwest')
set(gca,'FontSize',17)
pos2 = get(sp_hand2, 'Position'); % gives the position of current sub-plot
new_pos2 = pos2 +[0 0 0.01 0.02];
set(sp_hand2, 'Position',new_pos2 ); % set new position of current sub - plot

sp_hand5 = subplot(2,3,5);
plot(x, hv0,'b',x, hv5,'c',x, hv10,'r',x,tv0,'b--',x,tv5,'c--',x,tv10,'r--','LineWidth',1)
xlabel('time (ns)')
%ylabel('Absorption-normalized PAS Velocity Potential')
%title('SCNP_{Water}A_{50}C_{50} and SCNP_{THF}A_{50}C_{50}')
%legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','northwest')
set(gca,'FontSize',17)
pos5 = get(sp_hand5, 'Position'); % gives the position of current sub-plot
new_pos5 = pos5 +[0 0 0.01 0.02];
set(sp_hand5, 'Position',new_pos5 ); % set new position of current sub - plot

sp_hand1 = subplot(2,3,1);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_C_100 1mgml-1 and velocity.mat');
h0 = D0./(a_H2O_100_690+a_H2O_100_730);
h0 = h0(1000:6000);
h5 = D5./(a_H2O_100_690+a_H2O_100_730);
h5 = h5(1000:6000);
h10 = D10./(a_H2O_100_690+a_H2O_100_730);
h10 = h10(1000:6000);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_C_100 1mgml-1 and velocity.mat');
t0 = D0./(a_THF_100_690+a_THF_100_730);
t0 = circshift(t0,-20);
t0 = t0(1000:6000);
t5 = D5./(a_THF_100_690+a_THF_100_730);
t5 = circshift(t5,-20);
t5 = t5(1000:6000);
t10 = D10./(a_THF_100_690+a_THF_100_730);
t10 = circshift(t10,-20);
t10 = t10(1000:6000);
x=x(1:5001)+4000;
plot(x, h0,'b',x, h5,'c',x, h10,'r',x,t0,'b--',x,t5,'c--',x,t10,'r--','LineWidth',1)
ylim([-0.06 0.02])
% legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','southwest')
xlabel('time (ns)')
ylabel('Absorption-normalized PAS Signal')
title('SCNP_{Water}C_{100} vs. SCNP_{THF}C_{100}')
set(gca,'FontSize',17)
pos1 = get(sp_hand1, 'Position'); % gives the position of current sub-plot
new_pos1 = pos1 +[0 0 0.01 0.02];
set(sp_hand1, 'Position',new_pos1 ); % set new position of current sub - plot

sp_hand4 = subplot(2,3,4);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_C_100 1mgml-1 and velocity.mat');
hv0 = v0./(a_H2O_100_690+a_H2O_100_730);
hv0 = hv0(1000:6000);
hv5 = v5./(a_H2O_100_690+a_H2O_100_730);
hv5 = hv5(1000:6000);
hv10 = v10./(a_H2O_100_690+a_H2O_100_730);
hv10 = hv10(1000:6000);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_C_100 1mgml-1 and velocity.mat');
tv0 = v0./(a_THF_100_690+a_THF_100_730);
tv0 = circshift(tv0,-20);
tv0 = tv0(1000:6000);
tv5 = v5./(a_THF_100_690+a_THF_100_730);
tv5 = circshift(tv5,-20);
tv5 = tv5(1000:6000);
tv10 = v10./(a_THF_100_690+a_THF_100_730);
tv10 = circshift(tv10,-20);
tv10 = tv10(1000:6000);
x=x(1:5001)+4000;
plot(x, hv0,'b',x, hv5,'c',x, hv10,'r',x,tv0,'b--',x,tv5,'c--',x,tv10,'r--','LineWidth',1)
ylim([-15 30])
xlabel('time (ns)')
ylabel('Absorption-normalized PAS Velocity Potential')
%title('SCNP_{Water}C_{100} and SCNP_{THF}C_{100}')
%legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','northwest')
set(gca,'FontSize',17)
pos4 = get(sp_hand4, 'Position'); % gives the position of current sub-plot
new_pos4 = pos4 +[0 0 0.01 0.02];
set(sp_hand4, 'Position',new_pos4 ); % set new position of current sub - plot

sp_hand3 = subplot(2,3,3);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\\SCNP_Water_A_75_C_25 1mgml-1 and velocity.mat');
h0 = D0./(a_H2O_25_690+a_H2O_25_730);
h0 = circshift(h0,-200);
h0 = h0(1000:6000);
h5 = D5./(a_H2O_25_690+a_H2O_25_730);
h5 = circshift(h5,-200);
h5 = h5(1000:6000);
h10 = D10./(a_H2O_25_690+a_H2O_25_730);
h10 = circshift(h10,-200);
h10 = h10(1000:6000);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_75_C_25 1mgml-1 and velocity.mat');
t0 = D0./(a_THF_25_690+a_THF_25_730);
t0 = t0(1000:6000);
t5 = D5./(a_THF_25_690+a_THF_25_730);
t5 = t5(1000:6000);
t10 = D10./(a_THF_25_690+a_THF_25_730);
t10 = t10(1000:6000);
x=x(1:5001)+4000;
plot(x,t0,'b--',x,t5,'c--',x,t10,'r--','LineWidth',1)
legend({'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','southwest')
hold on
plot(x, h0,'b',x, h5,'c',x, h10,'r','LineWidth',1)
hold off
%legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','southwest')
xlabel('time (ns)')
%ylabel('Absorption-normalized PAS Signal')
title('SCNP_{Water}A_{75}C_{25} vs. SCNP_{THF}A_{75}C_{25}')
set(gca,'FontSize',17)
pos3 = get(sp_hand3, 'Position'); % gives the position of current sub-plot
new_pos3 = pos3 +[0 0 0.01 0.02];
set(sp_hand3, 'Position',new_pos3 ); % set new position of current sub - plot

sp_hand6 = subplot(2,3,6);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_75_C_25 1mgml-1 and velocity.mat');
hv0 = v0./(a_H2O_25_690+a_H2O_25_730);
hv0 = circshift(hv0,-200);
hv0 = hv0(1000:6000);
hv5 = v5./(a_H2O_25_690+a_H2O_25_730);
hv5 = circshift(hv5,-200);
hv5 = hv5(1000:6000);
hv10 = v10./(a_H2O_25_690+a_H2O_25_730);
hv10 = circshift(hv10,-200);
hv10 = hv10(1000:6000);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_75_C_25 1mgml-1 and velocity.mat');
tv0 = v0./(a_THF_25_690+a_THF_25_730);
tv0 = tv0(1000:6000);
tv5 = v5./(a_THF_25_690+a_THF_25_730);
tv5 = tv5(1000:6000);
tv10 = v10./(a_THF_25_690+a_THF_25_730);
tv10 = tv10(1000:6000);
x=x(1:5001)+4000;
plot(x, hv0,'b',x, hv5,'c',x, hv10,'r',x,tv0,'b--',x,tv5,'c--',x,tv10,'r--','LineWidth',1)
ylim([-15 30])
xlabel('time (ns)')
%ylabel('Absorption-normalized PAS Velocity Potential')
%title('SCNP_{Water}A_{75}C_{25} and SCNP_{THF}A_{75}C_{25}')
%legend({'SCNP_{Water} \Deltat=0 ns','SCNP_{Water} \Deltat=5 ns','SCNP_{Water} \Deltat=10 ns', 'SCNP_{THF} \Deltat=0 ns','SCNP_{THF} \Deltat=5 ns','SCNP_{THF} \Deltat=10 ns'},'Location','northwest')
set(gca,'FontSize',17)
pos6 = get(sp_hand6, 'Position'); % gives the position of current sub-plot
new_pos6 = pos6 +[0 0 0.01 0.02];
set(sp_hand6, 'Position',new_pos6 ); % set new position of current sub - plot

figure
tr = [3.2 10 15.8 25 31.6 50 63.1 100];
ppH2O_50 = [0.0032 0.0076 0.0161 0.0434 0.0615 0.406 0.7509 2.094];
ppH2O_50 = ppH2O_50./(a_H2O_50_690+a_H2O_50_730);
e1 = fit(tr', ppH2O_50', 'poly2');
yyaxis left
plot(e1, tr,ppH2O_50,'o','LineWidth',2)
% title('Plots with Different y-Scales')
xlabel('Transmission (%)')
ylabel('Absorption-normalized Peak to Peak Amplitude (V)')
hold on
ppH2O_100 = [0.0032 0.0054 0.0078 0.0103 0.0116 0.0184 0.0213 0.0346];
ppH2O_100 = ppH2O_100./(a_H2O_100_690+a_H2O_100_730);
e2 = fit(tr',ppH2O_100','poly1');
ppTHF_50 = [0.0032 0.0064 0.0094 0.0125 0.013 0.0195 0.0243 0.0363];
ppTHF_50 = ppTHF_50./(a_THF_50_690+a_THF_50_730);
e3 = fit(tr',ppTHF_50','poly1');
yyaxis right
plot(e2,tr,ppH2O_100, e3,tr, ppTHF_50,'LineWidth',2)
ylabel('Absorption-normalized Peak to Peak Amplitude (V)')
legend({'SCNP_{Water}A_{50}C_{50}','SCNP_{Water}C_{100}','SCNP_{THF}A_{50}C_{50}'},'Location','northwest')
set(gca,'FontSize',20)
hold off





figure
subplot(2,3,1);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_C_100 1mgml-1 and velocity.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{Water}C_{100}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

subplot(2,3,2);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_50_C_50 1mgml-1 and velocity.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{Water}A_{50}C_{50}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

subplot(2,3,3);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_75_C_25 1mgml-1 and velocity.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{Water}A_{75}C_{25}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

subplot(2,3,4);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_C_100 1mgml-1 and velocity.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{THF}C_{100}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

subplot(2,3,5);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_50_C_50 1mgml-1.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{THF}A_{50}C_{50}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

subplot(2,3,6);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_75_C_25 1mgml-1 and velocity.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Signal (V)')
title('SCNP_{THF}A_{75}C_{25}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','southwest')

figure

subplot(2,3,1);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_C_100 1mgml-1 and velocity.mat');
plot(x,v0,'b',x,v5,'c',x,v10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{Water}C_{100}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')

subplot(2,3,2);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_50_C_50 1mgml-1 and velocity.mat');
plot(x,v0,'b',x,v5,'c',x,v10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{Water}A_{50}C_{50}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')

subplot(2,3,3);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_Water_A_75_C_25 1mgml-1 and velocity.mat');
plot(x,v0,'b',x,v5,'c',x,v10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{Water}A_{75}C_{25}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')

subplot(2,3,4);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_C_100 1mgml-1 and velocity.mat');
plot(x,v0,'b',x,v5,'c',x,v10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{THF}C_{100}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')

subplot(2,3,5);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_50_C_50 1mgml-1 velocity potential.mat');
plot(x,D0,'b',x,D5,'c',x,D10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{THF}A_{50}C_{50}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')

subplot(2,3,6);
load('C:\Users\Nutzer\OneDrive - physik.uni-halle.de (1)\Report\01.03.2022\SCNP_THF_A_75_C_25 1mgml-1 and velocity.mat');
plot(x,v0,'b',x,v5,'c',x,v10,'r','LineWidth',2);
xlabel('t (ns)')
ylabel('PAS Velocity Potential')
title('SCNP_{THF}A_{75}C_{25}')
legend({'\Deltat=0 ns','\Deltat=5 ns','\Deltat=10 ns'},'Location','south')



