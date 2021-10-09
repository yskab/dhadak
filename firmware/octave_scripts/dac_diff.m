#A bad quick jugaad script to demonstrate difference signal output

clc;
clear;

t = [0:0.08:10];
s = zeros(1,length(t));

for i=1:11:length(t)-10
  for j=1:5
    if(mod(i,2)==0)
      s(i+j) = 1;
    else 
      s(i+j) = 1.5;
    endif
  endfor
endfor

d = zeros(1,length(t));

for i=0:11:length(t)-10
  for j=1:7
    if(mod(i,2)==0)
      d(i+j) = 1.3;
    else 
      d(i+j) = 0.9;
    endif
  endfor
endfor

for i=1:length(d)
  if(d(i) == 0)
    d(i) = 0.1;
   endif
endfor

v = zeros(1,length(d));
for i=1:length(d)
  if(s(i) - d(i) >= 0)
    v(i) = s(i) - d(i);
   endif
endfor


subplot(2,1,1);
hold on;
box on;
plot(t,s);
plot(t,d,"r-");
ylabel("Amplitude");
xlabel("Time");
h1 = legend ("V1: Main Signal","V2: DAC Signal");
legend (h1, "location", "northeast");
axis([0 10 0 2]);

subplot(2,1,2);
plot(t,v,"m-");
ylabel("Amplitude");
xlabel("Time");
h2 = legend ("V1-V2: Subtracted Signal");
legend (h2, "location", "northeast");
axis([0 10 0 0.5]);
