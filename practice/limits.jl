using CalculusWithJulia
using Plots
using Richardson
using SymPy

x = 1/10000
(1 + x)^(1/x)

f(x) = (1 + x)^(1/x) 
xs = [1/10^i for i in 1:5]
[xs f.(xs)]

0/0, Inf/Inf, 0 * Inf, Inf - Inf

0^0, 1^Inf, Inf^0

x = 1 
sin(x) / x

f(x) = sin(x)/x
xs, ys = unzip(f, -π/2, π/2)
plot(xs, ys)
scatter!(xs, ys)

plot(sin, -π/2, π/2)
plot!(identity)

plot(sin, identity, -π/2, π/2)

f(x) = (x^2 - 5^x + 6) / (x^2 + x - 6)
c = 2
f(c)

c, delta = 2, 1
plot( x -> (x^2 - 5x + 6) / (x^2 + x - 6), c - delta, c + delta)

f(x) = x == 2.0 ? -0.2 : (x^2 - 5x + 6) / (x^2 + x - 6) 

f(x) = (sqrt(x) - 5) / (sqrt(x-16) - 3)

c = 25
f(c)

hs = [1/10^i for i in 1:8]

xs = c .+ hs
ys = f.(xs)

[xs ys]

xs = c.- hs
ys = f.(xs)
[xs ys]

c = 1
f(x) = x^x
ys = [(f(c + h) - f(c)) / h for h in hs]
[hs ys]

g(x) = (1 - cos(x)) / x^2
g(0)

xs = 0 .+ hs
ys = [g(x) for x in xs]
[xs ys]

y1s = [1 - cos(x) for x in xs]
y2s = [x^2 for x in xs]
[xs y1s y2s]

h(x) = x^2 + 1 + log(abs(11*x - 15))/99
c = 15/11
hs = [1/10^i for i in 4:3:16]
xs = c .+ hs
[xs h.(xs)]

f(x) = sin(x)/x
extrapolate(f,1)

# extrapolate(1) do x
#     @show x
#     sin(x)/x
# end

f(x) = (1 - cos(x)) / x^2
extrapolate(f, 1)

f(x) = (sqrt(x) - 5) / (sqrt(x-16) - 3)
c = 25
extrapolate(f, 1, x0=25)

f(x) = (x^2 - 2x + 1)/(x^3 - 3x^2 + 2x + 1)
extrapolate(f, 10, x0=Inf)

@syms x::real
limit((1 - cos(x)) / x^2, x => 0)

f(x) = x^2 + 1 + log(abs(11x - 15)) /99
limit(f(x), x => 15 // 11)

limit((2sin(x) - sin(2x)) / (x - sin(x)), x => 0)

f(x) = (exp(x) - 1 - x) / x^2
limit(f(x), x => 0)

@syms rho::real
limit((x^(1-rho) - 1) / (1 - rho), rho => 1)

j(x) = cos(x) / (x - π/2)
j(π/2)

limit(j(x), x => π/2)
plot(j, π/4, 3π/4)

f(x) = cos(x) / (x - π/2)
limit(f(x), x => π/2)

limit(ceil(x), x => 0), limit(ceil(x), x => 0, dir="-")

l(x) = cos(π*x) / (1 - (2x)^2)
# limit(l, 1//2)

limit(sin(π*x)/(π*x) * l(x), x => 1//2)

plot(cos(π*x), 0.4, 0.6)
plot!(1 - (2x)^2)

plot(cos(π*x), 0.4, 0.6)
plot!(-π * (x - 1/2))

f(x) = 3x + 2
c, L = 1, 5
epsilon = rand()                 # some number in (0,1)
delta = epsilon / 3
xs = c .+ delta * rand(100)       # 100 numbers, c < x < c + delta
as = [abs(f(x) - L) < epsilon for x in xs]
all(as)                          # are all the as true?


f(x) = (cos(x) - 1) / x
plot(f(x))

f(x) = (3x^2 - x - 10) / (x^2 - 4) 

limit(f(x), x => 2)

