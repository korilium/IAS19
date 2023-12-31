using Pluto

Pluto.run()

#https://raw.githubusercontent.com/JuliaActuary/Learn/master/MortalityTableComparison.jl



mk = MortBel("MK")
fk = MortBel("FK")
mr= MortBel("MR")
fr= MortBel("FR")

survival(mk, 25,70)
survival(fk, 25,70)
survival(mr, 25,70)
survival(fr, 25,70)
issueAge = 25 

# compare against other tables 

#MK
k = 1000450.59
s = 0.999106875782
g = 0.999549614043
c = 1.103798111448

########
##-FK-##
########
k = 1000097.39
s = 0.999257048061 
g = 0.999902624311
c = 1.118239062025

l(x) = k * s^x * g^c^x
l(70)/l(25)
l(105)
#plot and compare 
x = range(25,70,length= 50)

survm = survival.(mk,24, x)
survf = survival.(fk,24,x)
survmr = survival.(mr,24,x)
survfr = survival.(fr,24,x)
plot(x, survm, label = "MK")

plot!(x, survf, label = "FK")
plot!(x, survmr, label = "MR")
plot!(x, survfr, label = "FR")
