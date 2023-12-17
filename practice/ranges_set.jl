# the first term of an arithmetic sequence is equal to 200 and the common difference is equal to -10 find the value of a20
# an = a0 + n*h

a0, h, n = 200, -10, 20
a0 + n * h

# an arithmetic sequence has a common difference equal to 10 and its 6th term is equal to 52. Find its 15th term a15
a6, h, m, n = 52, 10, 6, 15
a15 = a6 + (n-m)*h 

# a:h:b start,step,endof

1:10

collect(1:10)

collect(1:7:50)

collect(100:-7:1)

# generate evenly spaced points, between a and b
# a0 = a and a0 + (n-1) * h=b 
a, b, n = -1, 1, 9

h = (b-a)/(n-1)

collect(a:h:b)

function evenly_spaced(a, b, n)
    h = (b-a)/(n-1)
    collect(a:h:b)
end

evenly_spaced(0, 2π, 5)

# range does this for us
# linrange doesnt check for floating point errors and is more performant
xs = range(-1, 1, length=9)
collect(xs)

# filter function
filter(iseven, 0:25) # returns all even values between 0 and 25

filter(isprime, 100:200)

x = [0,2, 4, 6, 8, 10]

[2k for k in 0:50]

[7k for k in 1:10]

[x^2 for x in 1:10]

[2^i for i in 1:10]

[1/2^i for i in 1:10]

sum(2^i for i in 1:10)

sum(p for p in 1:100 if isprime(p))

sum(k for k in 1:100 if rem(k,7) == 0) # add multiples of 7

[k for k in 1:100 if rem(k,7) == 0]

# how many different ways can we generate one dollar with pennies, nickels, dimes, and quarters

ways = [(q, d, n, p) for q = 0:25:100 for d = 0:10:(100 - q) for n = 0:5:(100 - q - d) for p = (100 - q - d - n)]
length(ways)
ways[1:3]

# if we want to ensure the ammount in pennies is less than the ammount

[(q, d, n, p) for q = 0:25:100
    for d = 0:10:(100 - q)
    for n = 0:5:(100 - q - d)
    for p = (100 - q - d - n)
    if q > d > n > p]


rand()

rand(10)

[10^i for i in 1:6]

[(1/10)^i for i in 1:7]

[x^3 - 2x + 3 for x in -5:5]

length(filter(isprime, 1000:2000))
length(filter(isprime, 11000:12000))

sum(filter(isodd,0:100))

# h*n(n+1)/2 = -(n+1)a
# 2h = (-(n+1)a)/(n(n+1))
# h = 2(-(n+1)a)/(n(n+1))

a, b, n = -1, 1, 9

h = 2*((-(n+1)*a)/(n*(n+1)))

collect(a:h:b)

sum(2^i for i in 0:10)

prod(1:2:19)