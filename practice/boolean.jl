
# is the point (1,2) in the disc x^2 + y^2 <= 1?

x,y = 1, 2
x^2 + y^2 <= 1

a,b,c = 3, 2, 1
a < b, a + c < b + c

a,b,c = rand(3)
a < b, c*a < c*b

a,b = rand(2)
a < b, -a > -b

a,b = rand(2)
a < b, 1/a > 1/b

x = -1; exp(x) >= 1 + x
x =  0; exp(x) >= 1 + x
x =  1; exp(x) >= 1 + x

a,b = rand(2)
(exp(b) - exp(a)) / (b-a) > exp((a+b)/2)

x = 18
abs(x - 5) < 7

-7 < x - 5 < 7

(-7 < x - 5) && (x - 5 < 7)

(x - 5 < -7) || (x - 5 > 7)

true + true + false, false * 1000

(x > 0) * x

sin(1000)



a,b = rand(2)

a^a + b^b >= a^b + b^a

x = pi + 1/10 * (2rand()-1)
abs(x - pi) < 1/10, abs(sin(x) - sin(pi)) < 1/10

x = 12 



(abs(x - 3) + abs(x - 9)) > 12