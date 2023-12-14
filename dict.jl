
# declaring 
D = Dict("a" => 1, "b" => 2, 1 => "a")

D = Dict([("a", 1), ("b", 2), (1,"a")])

for e in D
    println(e)
end
println()
for (k,v) in D
    println(k, " => ", v)
end

# modifying 

D["c"] = 3
D["c"] = "Hello"
D = delete!(D, "c")