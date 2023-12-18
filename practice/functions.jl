using CalculusWithJulia
using Plots

f(x) = cos(x)
g(x) = x^2 - x
h(x) = sqrt(x)

f(π), g(2), h(4)

# domian error
# h(-1) 

x = -40
y = 5/9 * (x - 32)

f(x) = 5/9 * ( x - 32)
f(72)

if x < 0
    -1
elseif x > 0
    1
end

if x < 0
elseif x > 0
    1
else
    0
end

# ternary operator

abs_val(x) = x >= 0 ? x : -x

bigger_10(x) = x > 10 ? x : 10.0

# fuction call to represent a cell phone plan where the first 500 minutes are 20 dollars and every additional minute is 5 cents
cellplan(x) = x < 500 ? 20.0 : 20.0 + 0.05 * (x-500)

# ternary can be used to define an explicit domain of non negative h and t values
h(t) = 0 <= t <= sqrt(10/16) ? 10.0 - 16t^2 : error("t is not in the domain")

# nested ternary operator
s(x) = x < 0 ? -1 :
    x > 0 ? 1 : error("0 is not in the domain")

function sq(x)
    return x^2
end

function trajectory(x)
    g, v0, θ, k = 9.8, 200, 45*pi/180, 1/2
    a = v0 * cos(θ)

    (g/(k*a) + tan(θ))* x + (g/k^2) * log(1 - (k/a)*x)
end

trajectory(100)

# secant method

function secant_intersection(f, a, b)
    # solve 0 = f(b) + m * (x-b) where m is the slope of the secant line
    # x = b - f(b)/m
    m = (f(b) - f(a) / (b - a))
    b - f(b) / m
end

# if we want to solve for f(x) = 0 and we have two "rough" guesses for the answer.
# we want to solve q(x) = x^2 - 2 and our "rough" guesses are 1 and 2. Call these values a and b.
# we inprove our "rough" guesses by finding a value c which is the intersection point of the secant line

q(x) = x^2 - 2
a, b = 1, 2
c = secant_intersection(q, a, b)

q(c)

# closer guess than 1, 2
# rename a and b with b and c values and run the function again.

a, b = b, c
c = secant_intersection(q, a, b)
q(c)

# now its even closer to zero
# lets do it iteratively

# a, b = 1, 2
# for step in 1:6
#     a, b = b, secant_intersection(q, a, b)
#     current = (c=b, qc=q(b))
#     @show current
# end

m, b = 2, 3
mxb(x) = m*x + b

mxb(0), mxb(2)

m, b = 3, 2

mxb(0)

# key word parameters
mxplusb(x; m=1, b=0) = m*x + b
mxplusb(0)
mxplusb(0; m=3, b=2)

function trajectory(x; g = 9.8, v0 = 200, θ = 45*π/180, k = 1/2)
    a = v0 * cos(θ)
    (g/(k*a) + tan(θ))* x + (g/k^2) * log(1 - k/a*x)
end
trajectory(100)

# F(X,P) style
# we can pass parameters that are in a container as a single argument to a function

function trajectory(x, p)
    g, v0, θ, k = p.g, p.v0, p.θ, p.k # unpacking parameters

    a = v0 * cos(θ)
    (g/(k*a) + tan(θ))* x + (g/k^2) * log(1 - k/a*x)
end

p = (g=9.8, v0=200, θ = 45*pi/180, k=1/2)
trajectory(100, p)

# multiple dispatch
methods(log,(Number,))

function twotox(x::Integer)
    (2//1)^x
end
twotox(x::Real) = (2.0)^x
twotox(x::Complex) = (2.0 + 0.0im)^x

# for all rectangles of perimeter 20, what is the one with the largest area

Area(w, h) = w * h
height(w) = (20 - 2*w)/2

# compose functions
Area(w) = Area(w, height(w))

plot(Area, 0, 10)

# anonymous functions

f(x) = x^2 - 2x
g(x) = f(x - 3)

function shift_right(f; c=0)
    function(x) # <- anonymous function
        f(x - c)
    end  
end

f(X) = x^2 - 2X
l = shift_right(f, c=3)

shift_right_alt(f; c=0) = x -> f(x-c)

function secant(f, a, b)
    m = (f(b) - f(a)) / (x - a)
    x -> f(a) + m * (x - a)
end

f(x) = x^2 - 2
a,b = 1, 2
secant(f,a,b)(3/2)

# closures

mxplusb(x; m=0, b=0) = m*x + b
specific_line(m,b) = x -> mxplusb(x; m=m, b=b)

filter(<(2), 0:4)

# do notation
open("somefile.txt", "w") do io
    write(io, "Four score and seven")
    write(io, "years ago...")
end

# piping

exp(sin(log(3))), 3 |> log |> sin |> exp

x, lo, hi = -10, -5, 5 # clampl(x, lo, hi) is -5
x |> x -> max(x, lo) |> x -> min(x,hi)

# or 

x |> Base.Fix2(max, lo) |> Base.Fix2(min, hi)

secant_intersection(f, a, b) = b - f(b) * (b - a) / (f(b) - f(a))  # rewritten
f(x) = x^2 - 2
a, b = 1//1, 2//1
c = secant_intersection(f, a, b)

