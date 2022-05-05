close all;clear;clc
addpath('\\userdata.uni-halle.de\physik\FB MedPhys\Labore\Biozentrum C-Trakt\C.2.12\Software\MATLAB\PAS project\v2p6');
filepath='\\userdata.uni-halle.de\physik\FB MedPhys\Labore\Biozentrum C-Trakt\C.2.12\Software\LabVIEW\PAS Project\Data\SCNP aBOD 50% THF 1mgml-1 in Water pump 690 probe 730 delay 0ns with averaging 10 with ND0.6_20220322_164632_948.tdms';% data path
st=TDMS_getStruct(filepath); % Get Structure of the Measurement, we can find the wavelength, delay time.. 
n=2000; 
x = 0:5:n*5-1;% x axis, 200MHz Sampling rate
a_THF_50_690 = 1.316;
a_THF_50_730 = 0.646;
a_THF_50 = a_THF_50_690 + a_THF_50_730;

a_THF_100_690 = 1.695;
a_THF_100_730 = 0.938;
a_THF_100 = a_THF_100_690 + a_THF_100_730;
data=0;

for i = 0:9
    s=horzcat('c_', num2str(i), '_CH0');
    CH=struct2cell(getfield(st.M690S730D0,s));
    data=data+cell2mat(CH(3));
    i = i+1;
end
M1 = data./10;

M1 = M1(1:1900)-mean(M1(1:400));
M1 = M1(401:1800);
M1 = M1./a_THF_50;
x = x(1:1400);
[ P, ix ] = max(M1)
plot(x,M1,'b','LineWidth',4)
hold on

data=0;

for i = 0:9
    s=horzcat('c_', num2str(i), '_CH0');
    CH=struct2cell(getfield(st.M690S730D5,s));
    data=data+cell2mat(CH(3));
    i = i+1;
end
M2 = data./10;

M2 = M2(1:1900)-mean(M2(1:400));
M2 = M2(401:1800);
M2 = M2./a_THF_100;
x = x(1:1400);
[ P, ix ] = max(M2)
plot(x,M2,'c','LineWidth',4)

data=0;

for i = 0:9
    s=horzcat('c_', num2str(i), '_CH0');
    CH=struct2cell(getfield(st.M690S730D10,s));
    data=data+cell2mat(CH(3));
    i = i+1;
end
M3 = data./10;

M3 = M3(1:1900)-mean(M3(1:400));
M3 = M3(401:1800);
M3 = M3./a_THF_100;
x = x(1:1400);
[ P, ix ] = max(M3)
plot(x,M3,'r','LineWidth',4)

legend({'0 ns','5 ns','10 ns'},'Location','southwest')
xlabel('t (ns)')
%ylabel('Averaged SCNP_{Water}A_{75}C_{25} 2 mgml^{-1} Signal (V)')
%title('SCNP_{Water}A_{75}C_{25} 2 mgml^{-1} with Pump 690 nm Probe 730nm delay 0, 5, 10 ns')
set(gca,'FontSize',18)

% hold off
figure
v1 = cumtrapz(x,M1);
plot(x,v1,'b','LineWidth',4)
hold on
v2 = cumtrapz(x,M2);
plot(x,v2,'c','LineWidth',4)
v3 = cumtrapz(x,M3);
plot(x,v3,'r','LineWidth',4)
legend({'0 ns','5 ns','10 ns'},'Location','southwest')
xlabel('t (ns)')
%ylabel('Averaged SCNP_{Water}A_{75}C_{25} 2 mgml^{-1} Velocity Potential')
% title('SCNP_{water}A_{50}C_{50} 1 mgml^{-1} with Pump 690 nm Probe 720nm delay 0, 5, 10 ns')
set(gca,'FontSize',18)
hold off
