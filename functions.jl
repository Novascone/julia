
function sum_zeta(s,nterms)
    x = 0
    for n in 1:nterms
        x = x + (1/n)^s
    end
    return x
    
end

print(sum_zeta(2,100000)), println()

# same as function above
# sum_zeta(s,nterms) = sum(1/n^s for n=1:nterms)

# optional keywords, add a default to enable optional keywords
# sum_zeta(s,nterms=10000) = sum(1/n^s for n=1:nterms)

# function that accepts arguments based on name rather than position
# replace , with ; to enable this
# sum_zeta(s;nterms=10000) = sum(1/n^s for n=1:nterms)

# functions with multiple outputs
function circle(r)
    area = π * r^2
    circumference = 2π * r
    return area, circumference    
end

a, c = circle(1.5)

println()
print(a," ",c)
println()
# functions that modify their input (! notation)

function add_one!(x)
    x .= x .+ 1
end

x = [1,2,3]
println()
print(add_one!(x))
println()
println()
# anonymous functions

function secant(f,a,b,rtol,maxIters)
    iter = 0
    while abs(b-a) > rtol*abs(b) && iter < maxIters
        c,a = a,b
        b = b + (b-c)/(f(c)/f(b)-1)
        iter = iter + 1
    end
    return b
end

ϕ = secant(x-> x^2 - x - 1, 1, 2, 1e-15, 10)
print(ϕ)
println()