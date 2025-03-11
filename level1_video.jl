# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции

println("Hello world!")

my_answer = 20
println(typeof(my_answer))

my_pi = 3.14159
println(typeof(my_pi))

my_name = "Rika"
println(typeof(my_name))

my_answer = my_name
println(typeof(my_answer))

# a little one
#=
a
huge
one
=#

sum = 1 + 2
difference = 3 - 4
product = 20 * 5
quotient = 100 / 10
quotient_test = 10 / 100
println(typeof(quotient))
println(typeof(quotient_test))
power = 10 ^ 2
modulus = 101 % 2

str1 = "A string"
str2 = """ and a string too"""
println("""Are there any "errors" here?""")

println(typeof('a'))

println("My name is $my_name")
println("The result is $(sum + product)")


println(string("One, ", "two,"))
println("three, ", 4, ", five.")

println(str1*str2)
println("$str1$str2")

numbers = Dict("0" => "zero", "1" => "one")
println(numbers)
numbers["2"] = "two"
println(numbers)
println(numbers["1"])

myfavoriteanimals = ("parrots", "dogs", "monkeys")
println(myfavoriteanimals)
println(myfavoriteanimals[1])

myfavoriteanimals_array = ["parrots", "dogs", "monkeys"]
println(myfavoriteanimals_array)
fibonacci = [1, 1, 2, 3, 5, 8, 13]
println(fibonacci)
mix = [1, 2.0, 'a']
println(mix)
println(myfavoriteanimals_array[3])
myfavoriteanimals_array[3] = "fishes"
println(push!(fibonacci, 21))
println(pop!(fibonacci))
println(fibonacci)
favorites = [myfavoriteanimals_array, ["caramel", "chocolate", "cookies"]]
println(favorites)
numbers_array = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]
println(numbers_array)
println(rand(4, 3))
println(rand(4, 3, 2))

n = 0
while n < 3
    global n += 1
    println(n)
end
i = 0
while i < length(myfavoriteanimals_array)
    global i += 1
    favoriteanimals = myfavoriteanimals_array[i]
    println("My favorite animals are $favoriteanimals.")
end
for n in 1:3
    println(n)
end
for favoriteanimals in myfavoriteanimals_array
    println("My favorite animals are $favoriteanimals.")
end
for n = 1:3
    println(n)
end
m, n = 5, 5
A = zeros(m, n)
println(A)
for i in 1:m
    for j in 1:m
        A[i, j] = i + j
    end
end
println(A)
B = zeros(m, n)
for i in 1:m, j in 1:n
    B[i, j] = i + j
end
println(B)
C = [i + j for i in 1:m, j in 1:n]
println(C)
for n in 1:3
    A = [i + j for i in 1:n, j in 1:n]
    display(A)
end

x = 228
y = 1488
if x > y
    println("$x is larger than $y")
elseif y > x
    println("$y is larger than $x")
else
    println("$x and $y are equal!")
end
if x > y
    println(x)
else
    println(y)
end
println((x > y) ? x : y)
(x > y) && println("$x is larger than $y")
(x < y) && println("$y is larger than $x")

name = ""
function sayhi(name)
    println("Hi, $name", "!")
end
function f(x)
    x^2
end
sayhi("friend")
println(f(2))
sayhi2(name) = println("Hi, $name", "!")
f2(x) = x^2
sayhi2("dear")
println(f2(3))
sayhi3 = name -> println("Hi, $name", "!")
f3 = x -> x^2
sayhi3("bro")
println(f3(4))
sayhi(1337)
println(f(A)) #but won't work on vectors

v = [3, 5, 2]
println(sort(v))
println(v)
println(sort!(v))
println(v)

A = [i + 3 * j for j in 0:2, i in 1:3]
println(A)
println(f(A))
println(f.(A))
println(f.(v))


using Example
println(hello("i hope it works."))
using Colors
palette = distinguishable_colors(20)
rand_palette = rand(palette, 3, 3)

using Plots
x = -3:0.1:3
f(x) = x^2
y = f.(x)
gr()
plot(x, y, label = "line")
scatter!(x, y, label = "points")
