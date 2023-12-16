import LinearAlgebra: norm
import Statistics: mean
x,y = 1, 2

v = [x, y]

10 * v

norm(v)

v/norm(v)

w =[3, 2]
v + w, v - 2w

atan(y, x)

fibs = [1, 1, 2, 3, 5, 8, 13]

["one", "two", "three"]

[true, false, true]

[1, 2.0, 3//1] # promotes values to a common type

["one", 2, 3.0, 4//1] # no common type so any is used

vs = [1, 2]
v1,v2 = vs

vs[2]

vs[2] = 10

vs

v[length(v)]
v[end]

v1 = [1, 1, 2, 3, 5, 8]
sum(v1), prod(v1)

unique(v1)

maximum(v1)

extrema(v1)

v = [1,4,2,3]

sort(v)

sort(v, rev=true)

push!(v, 5) # adds element

append!(v1, [6,8,7]) # adds multiple elements

# julia convention is to name mutating function with a trailing !

# sort - non mutating, sort! - mutating

w = copy(v)

v = [1, 2, 3, 4]
sum(v), length(v)

# broadcasting a function
# . "brodcasts" the function call
# broadcasting applies the function to each element

xs = [1, 1, 3, 4, 7]
sqrt.(xs)
sin.(xs)

xs .^ 2

ys = [1/5000, 1/500, 1/50, 1/5, 5, 50]
base = (100)^(1/5)
log.(base, ys)

xs = [1, 1, 2, 3, 5, 8, 13]
n = length(xs)
(1/(n-1)) * sum(abs2.(xs .- mean(xs)))

xs = [1, 2, 3, 4, 5]
[x^3 for x in xs]

xs .^ 3

[x for x in 1:100 if rem(x,7) == 0] # the set of x such that the remainder on division by 7 is zero for all x in 1,2,...,100,.

# ploting f(x) = x^2 with 7 points over [-1,1]
a, b, n = -1, 1, 7
d = (b-a) // (n-1)
xs = [a, a+d, a+2d, a+3d, a+4d, a+5d, a+6d] # x values

ys = [x^2 for x in xs] # y values

[xs ys] # space between objects makes them horizontally combined ',' makes the vertically combined, and ';' makes them vertically concatinated

nt = (one=1, two=:"two", three=:three)
nt.one, nt[2], nt[end]

v = [10, 15]
norm(v)

v = [3, 4]
unitv = v/norm(v)

v = [3, 4]
w = [1, 2]

2v + 5w

v = [1, 1, 2, 3, 5, 8, 13, 21]

length(v)
sum(v)
prod(v)

