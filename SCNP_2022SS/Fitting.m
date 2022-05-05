clear;clc
addpath('\\userdata.uni-halle.de\physik\FB MedPhys\Labore\Biozentrum C-Trakt\C.2.12\Software\MATLAB\PAS project\v2p6');
filepath='\\userdata.uni-halle.de\physik\FB MedPhys\Labore\Biozentrum C-Trakt\C.2.12\Software\LabVIEW\PAS Project\Data\pure aBOD 5x10-5M pump 690 probe 720 delay 0 with averaging 1000_20220222_154356_441.tdms';% data path
st=TDMS_getStruct(filepath); % Get Structure of the Measurement, we can find the wavelength, delay time.. 
data=TDMDRead(filepath);% Load Data as a 4D Matrix (which wavelength and delay-time, 1, Acquisition Channel (Averaging number), Intensity data)
% The order of which wavelength and delay-time, we could check st=TDMS_getStruct(filepath)
% For Example (picture below), M800S1000D0 is order 1, averaging number is 10
% The Pump800Probe1000Delay0 measurements = data(1,1,:,:), then we can average = mean(squeeze(data(1,1,:,:)))
% We could check more information from Props 
s=size(data);% the dimension of the Matrix
N1=1; %
m1=squeeze(data(N1,1,1,:))'; % the data from the CH0
n=length(m1); % the length of the data
a=length(squeeze(data(N1,1,:,1)));% the number of the CHs
x = 0:5:n*5-1;% x axis, 200MHz Sampling rate

for k = 1:a
    y = squeeze(data(1,1,k,:));
    plot(x,y,'b')
    axis([0 n*5-1 -0.04 0.03])
    pause(0.1)
end


M = squeeze(data(N1,1,:,:));
M1=mean(M); % Averaging the data from all CHs

% if I only choose [5000,5800] ---[1000, 1160] to fit the exponential coeficient

Me = M1(1000:1160);
xe = x(1000:1160);

figure(1)
plot(x,M1);
% hold on
% plot(x,M2);
[ P, ix ] = max(M1)
[Pm, ixm] = min(M1)
amp_pp = max(M1)-min(M1)


title('Mice Red Blood Cell with Pump 572nm and Probe 584 nm, 0 ns delay time')
% legend({''},'Location','northwest')
xlabel('t (ns)')
ylabel('PAS Amplitude (V)')
xlim([3000,8000])
% xlim([5000,5900])
% hold off

figure(2)
plot(x,M1);

title('Mice Red Blood Cell with Pump 572nm and Probe 584 nm, 0 ns delay time')
% legend({''},'Location','northwest')
xlabel('t (ns)')
ylabel('PAS Amplitude (V)')
% xlim([3000,8000])
xlim([5000,5900])
% hold off