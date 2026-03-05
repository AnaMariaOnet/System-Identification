%%
% Nume si prenume: Onet Ana-Maria
%

clearvars
clc

%% Magic numbers (replace with received numbers)
m = 3; 
n = 15; 

%% Process data (fixed, do not modify)
c1 = (1000+n*300)/10000;
c2 = (1.15+2*(m+n/10)/20);
a1 = 2*c2*c1;
a2 = c1;
b0 = (1.2+m+n)/5.5;

rng(m+10*n)
x0_slx = [2*(m/2+rand(1)*m/5); m*(n/20+rand(1)*n/100)];

%% Experiment setup (fixed, do not modify)
Ts = 10*c2/c1/1e4*1.5; % fundamental step size
Tfin = 30*c2/c1*10; % simulation duration

gain = 10;
umin = 0; umax = gain; % input saturation
ymin = 0; ymax = b0*gain/1.5; % output saturation

whtn_pow_in = 1e-6*5*(((m-1)*8+n/2)/5)/2*6/8; % input white noise power and sampling time
whtn_Ts_in = Ts*3;
whtn_seed_in = 23341+m+2*n;
q_in = (umax-umin)/pow2(10); % input quantizer (DAC)

whtn_pow_out = 1e-5*5*(((m-1)*25+n/2)/5)*6/80*(0.5+0.3*(m-2)); % output white noise power and sampling time
whtn_Ts_out = Ts*5;
whtn_seed_out = 23342-m-2*n;
q_out = (ymax-ymin)/pow2(9); % output quantizer (ADC)

u_op_region = (m/2+n/5)/2; % operating point

%% Input setup (can be changed/replaced/deleted)
t1=9;
wf = 1/t1;
fmin = wf/2/pi/10;%
fmax = wf/2/pi*10;
Ain = 1.3; 

u0 = 0;     % fixed
ust = 4;  % must be modified (saturation)
t1 = 12/a1; % recommended 
%% Data acquisition (use t, u, y to perform system identification)
out = sim("Onet_Ana_circuit_hidraulic_chirp.slx");

t = out.tout;
u = out.u;
y = out.y;

plot(t,u,t,y)
shg

%% System identification
yst=(8.72727+7)/2; 
ust=2.2500;
K=yst/ust

%%
%min-mx albastru
% max rosu-max albastru
w1=pi/(567.19-562.817)
deltaT1=560.749-562.917
phi1=rad2deg(w1*deltaT1)

%min si max rosu
% phiaprox-90grade

Ay = (9-6.68182)/2
Au = (3.57422-0.878906)/2
M = Ay/Au
Im = -M
wn = w1
zeta = -K/2/Im
%%
H = tf(K*wn^2,[1,2*zeta*wn,wn^2])
zpk(H)


T1=1/2.73
T2=1/0.189

ysim=lsim(H,u,t);
figure;
plot(t,u,t,y,t,ysim)


%%
A = [0,1; -1/T1/T2,-(1/T1+1/T2)];
B = [0;K/T1/T2]
C = [1,0];
D = 0;
sys = ss(A,B,C,D);
% validare pe intreaga portiune

ysim1 = lsim(sys,u,t,[y(1),10]);% judecam pe baza erorii=>0=14%=>20=>3.98%
figure
plot(t,u,t,y,t,ysim1);
J=1/sqrt(length(t))*norm(y-ysim1)
eMPN = norm(y-ysim1)/norm(y-mean(y))*100


