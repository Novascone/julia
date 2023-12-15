
num = 1 + 2*3^4
den = 5 - 6/7

println(num/den)

g = 9.8
v0 = 200
θ = 45
k = 1/2
t = 100
a = v0 * cosd(θ)

println()
println((g/(k*a) + tand(θ))* t + (g/k^2) * log(1 - (k/a)*t)),println()

b, θ, d = 1, π/4, 1
n, S = 0.025, 2/90
A = (b + d/tan(θ)) * d
P = b + 2d/sin(θ)
R = A / P
Q = R^(2/3) * S^(1/2) * A / n
println(Q),println()

s = 3
println(-16s^2 + 32s - 12), println()

# finding the slope

x0,y0 = 1,2
x1,y1 = 4,6
m = (y1-y0) / (x1-x0)

println(m),println()

a,b,c = 10, 2.3, 8

println((a-b)/(a-c)),println()

function f(x)
    y = 100 - 2x - x^2
    return y
end

println(f(4)),println()

a,b = 3.2, 2.3

println(a^b - b^a), println()

p,q = 0.25, 0.2
num = p - q 
den = sqrt(p*(1-p))
ans = num/den

println(ans), println()

function h(x)
    num = x^2 - 2x - 8
    den = x^2 - 9x - 20
    y = num/den
    return y    
end

println(h(3))
