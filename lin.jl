using LinearAlgebra
# matrix
A = [ 1 2 3;
      1 2 4;
      2 2 2]

print(A)
println(),println()

# vectors 
b1 = [4.0, 5, 6] # 3-element Vector{Float64}
b2 = [4.0; 5; 6] # 3-element Vector(Float64)
m1 = [4.0 5 6]   # 1x3 Matrix{Float64}

Ab = ["Hello", 1, 2, 3] # 4-element Vector{Any}

print(Ab)
println(),println()

# array comprehensions
# builds an array with the first 100,000 terms of a quadratic series and sums them
v = [1/n^2 for n=1:100000]
x = sum(v)

print(x)
println(),println()

# generator
gen = (1/n^2 for n=1:100000)
y = sum(gen)

print(x)
println(),println()

# undefined arrays

n = 5 # size
A1 = Array{Float64}(undef,n,n)
A2 = Matrix{Float64}(undef,n,n)

V1 = Array{Float64}(undef,n)
V2 = Vector{Float64}(undef,n)

# empty arrays
# these can grow dynamically
vb = Array{Float64}(undef,0)
# same thing vb = Float64[]

Az = zeros(8,9)
Bz = zeros(8,9)

println(Az),println()
println(Bz),println()

C = rand(6,6)

println(C),println()

M = 5I + rand(2,2)

println(M),println()