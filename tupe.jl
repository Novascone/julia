
# tuples 

t = (3.14, 2.72)

println(t),println()

# this is the same t = 3.14, 2.72
# tuples can't be modified once initialized 
# they can however be converted to array, be copied, and over written, plus more

# tuples to arrays

a = (1, 2, 3)

t1 = collect(a);
t2 = [x for x in a];
t3 = [a...];
# these all produce the same thing

# destrucing tuples

pi_approx, e_approx = t
# this makes a convinient return type for functions

# named tuples
p = ( x = 1.1, y = 2.4)

# elements of p can be accessed via p.x and p.y as well as p[1] and p[2]

# retreiving names, and values of keys

K = keys(p)
V = values(p)

# merge the key/value pair into a named tuple again
p_new = (; zip(K,V)...)

# merging named tuples 
TemporalParams = (
    Δt = 0.1,
    T = 2
)

SpatialParams = (
    Δ = 0.05,
    a = 0,
    b = 100
)

TotalParams = merge(TemporalParams, SpatialParams)

# destrucing named tuples

(; y, x) = p

(; a,b,Δt ) = TotalParams
# creates new symbols a, b, Δt without the need to reference with TotalParams.
 