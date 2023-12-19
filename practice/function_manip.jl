using CalculusWithJulia
using Plots
import Base: +
f::Function + g::Function = x -> f(x) + g(x)
# adds a method to the generic + function for functions.
# ::Function ensures it only applies to functions

ss = sin + sqrt
ss(4)

# composition of functions
# (f∘g) = sin(x)^2, (g∘f) = sin(x^2) are not the same

f(x) = x^2
g(x) = sin(x)
fg = f ∘ g
gf = g ∘ f
plot(fg, -2, 2, label="f∘g")
plot!(gf, label="g∘f")

# vertical shifts: h(x) = k + f(x), same as f but shifted up 5 units

# horizontal shifts: h(x) = f(x - k), same as f shifted right by k units

# stretching: h(x) = kf(x), same as f but streched by a factor of k in the y direction

# scaling: h(x) = f(kx), same as f compressed horizontally by a facotr of 1/k

# to implement these transformations in julia, we can define operators

up(f, k) = x -> f(x) + k
over(f, k) = x -> f(x - k)
stretch(f, k) = x -> k * f(x)
scale(f, k ) = x -> f(k * x)

f(x) = max(0, 1 - abs(x))
plot(f, -2, 2, label="f")
plot!(up(f,2), label="up")

plot(f, -2, 4, label="f")
plot!(over(f,2), label="over")

plot(f, -2, 2, label="f")
plot!(stretch(f,2), label="stretch")

plot(f, -2, 2, label="f")
plot!(scale(f,2), label="scale")

plot(f, -2, 4, label="f")
plot!(up(over(f,2), 1), label="over and up")

plot(f, -1,9, label="f")
plot!(scale(over(f,2),1/3), label="over and scale")

plot(f, -1,5, label="f")
plot!(over(scale(f,1/3),2), label="over and scale")


a = 2; b = 5
h(x) = stretch(over(scale(f, 1/a), b), 1/a)(x)
plot(f, -1, 8, label="f")
plot!(h, label="h")

# model for the length of a day in New York City
# this will need to take into account how daylight changes
# model for a modified sin curve is a + bsin(d(x-c))
# where b is related to amplitude, c the shift, and the period is T = 2π/d

a = 12
b = ((15 + 5/60 + 46/60/60) - (9 + 19/60 + 44/60/60))
d = 2π/365

# let January 1st be x = 0, the first day of spring will be March 21st, day 80
# (Date(2017, 3, 21) - Date(2017, 1, 1) + 1)
c = 80

newyork(t) = up(stretch(over(scale(sin, d), c), b), a)(t)
plot(newyork, -20, 385)

# to test we can look up the estimated daylight and compare

datetime = 15 + 0/60 + 4/60/60 # hours + minutes + seconds

delta = (newyork(185) - datetime) * 60

# pipeline operator
# g(x) = (x)^(1/2) and f(x) = sin(x)

g(x) = sqrt(x)
f(x) = sin(x)
π/2 |> g |> f

# operators

# storing the returned function, then calling it
# l(x) = action1(f,args...)(x)
# l(10)

# composing two operators
# action2( action1(f, args...), other_args...)

# two operators
D(f::Function) = k -> f(k) - f(k-1)

f(k) = 1 + k^2

D(f)(3), f(3) - f(3-1) # equivalent

# function that cumulatively sums values
# S(f)(k) = f(1) + f(2) + ... + f(k-1) + f(k)

S(f) = k -> sum(f(i) for i in 1:k)
S(f)(4), f(1) + f(2) + f(3) + f(4)

k = 10
D(S(f))(k), f(k) # the two functions cancel each other


