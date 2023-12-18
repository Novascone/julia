using CalculusWithJulia
using Plots

f(x) = 1 - x^2/2
plot(f, -3, 3)

plot(sin, 0, 2π)

f(x) = 1 / (1 + x^2)
plot(f, -3, 3)

f(x) = exp(-x^2/2)
plot(f, -2, 2)

# anonymous function plotting
plot(x -> cos(x) - x, 0, π/2)

# anonymous again
mxplusb(x; m=1, b=0) = m*x + b
plot(x -> mxplusb(x; m=1, b=1), -1, 2)

function mxplusb(x, p)
    m, b = p.m, p.b
    m * x + b
end

plot(x -> mxplusb(x, (m=-1, b=1)), -1, 2)

plot(0, pi/2) do x
    cos(x) - x
end

f(x) = tan(x)
plot(f, -10, 10)

pts_needed(f, xmin, xmax) = length(unzip(f, xmin, xmax)[1])
pts_needed(x -> 10x, 0, 10), pts_needed(x -> sin(10x), 0, 10)

# ploting with a specifc number of points 

xs = range(0, 2π, length=10)
ys = sin.(xs)

plot(xs, ys)

# refelctions

xs = range(-π, π, length=100)
ys = sin.(xs)
plot(xs, ys)

# reflect 
plot(-xs, ys)

plot(xs, -ys)

plot(-xs, -ys)

plot(ys, xs)

xs = range(-π/2, π/2, length=100)
ys = sin.(xs)
plot(ys, xs)

plot(0:π/4:2π, sin)

# NaN 

q(x) = 1/x
plot(q, -1, 1)
plot(q, -1, 1, ylims=(-10,10)) # here the asymptote is still plotted in the graph

# here we will plot 1/x and use NaN at the asymptote

xs = range(-1, 1, length=251)
ys = q.(xs)
ys[xs .== 0.0] .= NaN
plot(xs, ys)

# et voila

rangeclamp(f, hi=20, lo=-hi; replacement=NaN) = x -> lo < f(x) < hi ? f(x) : replacement
plot(rangeclamp(x -> 1/x), -1, 1)

# layers

f(x) = 1 - x^2/2
plot(cos, -π/2, π/2, label="cos")
plot!(f, -π/2, π/2, label="f")

# ploting the x-axis

f(x) = x^5 - x + 1
plot(f, -1.5, 1.4, label="f")
plot!(zero, label="zero")

# plotting the function f(x) = x * (x - 1) and emphasizing the fact that 0 and 1 are zeros

f(x) = x*(x-1)
plot(f, -1, 2, legend=false)
plot!(zero)
scatter!([0,1], [0,0])


# annotate!((x,y, label)) adds a label at the point (x,y)

# Bresenham's algorithm

f(x) = -(1/3) * x + 1
x0, x1 = 0, 14
y0, y1 = f(x0), f(x1)

A,B,C = -(y1 - y0), (x1 - x0), -x1*y0 + x0*y1

f(x,y) = A*x + B*y + C

xs = [(x0, y0)]
for i ∈ 1:(x1 - 1)
    xi, yi = xs[end]
    xi_plus_1 = xi + 1
    Δ = f(xi+1, yi-1/2)> 0 ? 1 : 0
    yi_plus_1 = yi - Δ
    push!(xs, (xi_plus_1, yi_plus_1))
end

xs

p = plot(f, x0, x1; legend=false, aspect_ratio=:equal,
xticks=0:x1, yticks = (floor(Int, f(x1))-1):(1 + ceil(Int, f(x0))))
col = RGBA(.64,.64,.64, 0.25)
for xy ∈ xs
    x, y = xy
    scatter!([x], [y]; markersie=5)
    scatter!([x+1], [y - 1/2], markersize=5, markershape=:star7)
    plot!(Shape(x .+ [0, 1, 1, 0], y .+ [0, 0, -1, -1]), color=col)
end

p

# graphs of parametric equations

f(x) = cos(x); g(x) = sin(x)
ts = range(0, 2π, length=100)
plot(f.(ts), g.(ts), aspect_ratio=:equal)

Θs  = [0, π/6, π/4, π/3, π/2, 2π/3, 3π/4, 5π/6, π]
plot(f.(Θs), g.(Θs), legend=false, aspect_ratio=:equal)
scatter!(f.(Θs), g.(Θs))

plot(f, g, 0, 2π, aspect_ratio=:equal)

x_squared(x) = x^2
x_cubed(x) = x^3
plot(x_squared, 0, 25)
plot!(x_cubed, 0, 25)

plot(x_squared, x_cubed, 0, 25)

f(x) = x^3
g(x) = x - sin(x)
plot(f, g, -π/2, π/2)

R, r, rho = 1, 1/4, 1/4 
f(t) = (R-r) * cos(t) + rho * cos((R-r)/r * t)
g(t) = (R-r) * sin(t) - rho * sin((R-r)/r * t)

plot(f, g, 0, max((R-r)/r, r/(R-r))*2π)

f(x) = 3x^4 + 8x^3 - 18x^2

plot(f)

f(x) = log(x) - 2
plot(f, xlims=(-10,10))
plot!(zero)

f(x) = x^3 - x
plot(f,-2,2)
plot!(zero)

f(x) = (x^3 - 2x)/(2x^2 - 10)
plot(f, -5, 5)
plot!(zero)

f(x) = x <= 10 ? 35.0 : 35.0 + 4.0 * (x-10)
plot(f, xlims=(0,20))

f(x) = cos(x)
g(x) = x
plot(f)
plot!(g)

xs = range(0, 1, length=250)
f(x) = sin(500*pi*x)
plot(xs, f.(xs))
plot(f, 0, 1)

R, r, rho = 1, 3/4, 1/4
f(t) = (R-r) * cos(t) + rho * cos((R-r)/r * t)
g(t) = (R-r) * sin(t) - rho * sin((R-r)/r * t)

plot(f, g, 0, max((R-r)/r, r/(R-r))*2pi, aspect_ratio=:equal)

function spirograph(R, r, rho)
    f(t) = (R-r) * cos(t) + rho * cos((R-r)/r * t)
    g(t) = (R-r) * sin(t) - rho * sin((R-r)/r * t)
  
    plot(f, g, 0, max((R-r)/r, r/(R-r))*2pi, aspect_ratio=:equal)
  end

spirograph(1, 1/4, 1/4)

spirograph(1, 1/2, 1/4)

spirograph(1, 1/4, 1)

spirograph(1, 1/8, 1/4)