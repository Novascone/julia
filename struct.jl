
# initialize
struct Location
    name::String
    lat::Float32
    lon::Float32
 end

 # initialize with values

loc1 = Location("London", 51.50722,-0.1275)

println(loc1.name)
println(loc1.lat)
println(loc1.lon)

# defining a vector of locations called sites and dynamically fill it with Location elements

sites = Location[]
push!(sites, Location("London", 51.50722,-0.1275))
push!(sites, Location("Logan", 41.735210,-111.834862))
println()
println(sites[2].name)

# mutable structs
# used to modify structs after initialization

mutable struct mLocation
    name::String
    lat::Float32
    lon::Float32
end

loc1 = mLocation("Logan", 41.735210,-111.834862)
loc1.name = "LGN"

# @kwdef
# default values and keyword constructers 

@kwdef mutable struct Param
    Δt :: Float64 = 0.1
    n :: Int64
    m :: Int64
end

P = Param(m=50, n=35)

println(P),println()

# destructing struct

(; n,Δt ) = P
# gets any field of P that matches what we write on the left-hand side and turn it 
# into a variable

print("The value of Δt is $(Δt)")