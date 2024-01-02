using CSV, DataFrames, Statistics, StatsBase, Random, Dates


#############
#description#
#############

# current data is made for a DC plan where death and life benefit are seperalty calculated (not mixed)
# there is no insured reserve yet it is a new plan that came into fruition. 
# the goal wuold be to make a program in which things evolve with each iteration 






######
#data#
######
df = CSV.File("data/names.csv") |> DataFrame

############
#parameters#
############

n = 45
seedValue = 666
Random.seed!(seedValue)
workingAge = 25 
legalRetAge = 67 
newPlan = 0 
BOY = Date(Year(now()).value, 1, 1)
EOY = Date(Year(now()).value, 12, 31)
minSal= 2100*12
maxSal=  10000*12
# formula 
S1 = 2100
S2(x)= x .- S1
a = 0.03
b = 0.07 


#################
#generating data#
#################

# Generate a random index
random_index = rand(1:size(df, 1))

# sample based on index 
randomIndices = sample(1:size(df,1),n )
Beneficiary = df[randomIndices,:]

#generate age, sex, status and salary 
Salary = rand(minSal:maxSal,n)
Age = rand(workingAge:legalRetAge, n)
Sex = rand([1,2], n)
Status = rand(["ACT", "DEF"], n)

################
# service time #
################

DOB = Date.(Dates.year(BOY) .- Age, rand(1:12,n), rand(1:28,n))

PBE = []  #period before entry 
for i in Age 
    perBefEnt = rand(workingAge:i)
    append!(PBE,perBefEnt)
end 

#DOE  = Date.(Dates.year.(DOB) .+ PBE, rand(1:12,n), rand(1:28,n))
DOE = repeat([BOY - Year(1)], n)
tx = rand([1,1,1,1,1,0.8,0.8,0.5],n)

pst =  Dates.year.(BOY) .- Dates.year.(DOE)

Beneficiary[:, "age"] = Age
Beneficiary[:, " sex"] = Sex
Beneficiary[:, "DOB"] = DOB 
Beneficiary[:,"DOE"] = DOE
Beneficiary[:, "salary"] = Salary 
Beneficiary[:, "status"] = Status
Beneficiary[:, "pst"] = pst
Beneficiary[:, "tst"] =  legalRetAge .- workingAge .- pst
Beneficiary[:,"tx"] = tx


##################################
# capital, reserves and premiums #
##################################

randScale(n, shift, scale) = (rand(n).+shift).*scale

prem = (a*S1 .+ b.*(S2(Salary))).* tx  .+ randScale(n,-0.5,0.05).*Salary

cap = prem * 1.02^(1/2)



Beneficiary[:, "Total Capital"] = cap
Beneficiary[:, "premie"] = prem
Beneficiary

CSV.write("data/data2023.csv", Beneficiary)