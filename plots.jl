
using Plots 
gr()

x = 0:0.05:1;
y = sin.(2π*x)
plot(x,y)