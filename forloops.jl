
x = 0
for k in 1:10000
    global x = x + (1/k)^2
end

print(x)
println()
println()

for i in 1:3
    for j in 1:3
        print("i=", i, " j=", j, "\n")
    end
end

# these are all the same as the nested for loops above

# for i in 1:3, j in 1:3
#     print("i=", i, " j=", j, "\n")
# end

# \in for ∈
# for i ∈ 1:3, j ∈ 1:3
#     print("i=", i, " j=", j, "\n")
# end


# break statement exits loop before it completes all iteratons
y = 0

for g in 1:100000
    term = (1/g)^2
    global y = y + term
    if (abs(term) < 1e-10) break end
end

println()
print(y)

# continue statement exits current iteration of a for loop and goes to the next one
numbers = randn(100)
sum = 0
for h in numbers
    if (h==0) continue end
    global sum = sum + 1/h
end

println()
print(sum)

