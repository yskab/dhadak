#A demonstration of algorithm which takes ADC samples 
#from microcontroller for both red & ir
#and applies peak and valley detection algorithm


clc;
clear;
pkg load signal;

#test samples under ADC_Samples
#redir1 - File with consecutive red & ir values
#redir2 - Another File with consecutive red & ir values
#ir1 - File with only Ir samples
#ir2 - Another file with only Ir samples

#consecutive red and ir values stored in text file
y = dlmread("ADC_Samples/redir2");
r = 1;
t = 1;
for i=1:length(y)
  if(mod(i,2))
    red(r) = y(i);
    r++;
  else
    ir(t) = y(i);
    t++;
  endif
endfor

 
#filter already applied in microcontroller, so no need to apply again here
#{
Fs = 500;
Fc = 3.3;
Wc = Fc/(Fs/2);
%Butterworth 2nd Order Low pass Filter
[b,a] = butter(1,Wc,'low');
#filt_out2 = filter(b,a,x);


#2nd order equation
filt_out2 = zeros(1,length(x));
for i=3:length(x)
  filt_out2(i) = (b(1)*x(i) + b(2)*x(i-2) - a(2)*filt_out2(i-1) + b(3)*x(i-1) - a(3)*filt_out2(i-2));
endfor

#1st order IIR Filter equation
red = zeros(1,length(x));
for i=2:length(x)
  red(i) = b(1)*(x(i) + x(i-1)) - a(2)*red(i-1); 
endfor

ir = zeros(1,length(x));
for i=2:length(x)
  ir(i) = b(1)*(x(i) + x(i-1)) - a(2)*ir(i-1); 
endfor
#}


#Find peak and valley using MMPD and store them
up_ctr = 0;
up_ctr_i = 0;
sctr_comp_i = 8;
sctr_comp_r = 8;
k = 1;
m = 1;
possible_peak_red = 0;
possible_peak_ir = 0;

for i = 2:length(ir)
  slope = red(i) - red(i-1);
  if(slope <= 0)
    if(!possible_peak_red)
      pkr(m) = i-1;
      possible_peak_red = 1;
    endif
    up_ctr++;
  else
    if(up_ctr >= sctr_comp_r)
      vlr(m) = i-1;
      m++;
      sctr_comp_r = 0.6*up_ctr; 
    endif
    up_ctr = 0;
    possible_peak_red = 0;
  endif

  slope = ir(i) - ir(i-1);
  if(slope <= 0)
    if(!possible_peak_ir)
      pki(k) = i-1;
      possible_peak_ir = 1;
    endif
    up_ctr_i++;
  else
    if(up_ctr_i >= sctr_comp_i)
      vli(k) = i-1;
      k++;
      sctr_comp_i = 0.6*up_ctr_i; 
    endif
    up_ctr_i = 0;
    possible_peak_ir = 0;
  endif
endfor


#Plot
subplot(2,1,1)
hold on;
box on;
plot(red,"r");
plot(pkr,red(pkr),"g*--");
plot(vlr,red(vlr),"b*--");
xlabel("Samples");
ylabel("Amplitude");
title("Red Signal");
legend ({"PPG Signal", "Detected Peak","Detected Valley"}, "location", "south");

subplot(2,1,2)
hold on;
box on;
plot(ir,"m");
plot(pki,ir(pki),"g*--");
plot(vli,ir(vli),"b*--");
xlabel("Samples");
ylabel("Amplitude");
title("IR Signal");
legend ({"PPG Signal", "Detected Peak","Detected Valley"}, "location", "south");

