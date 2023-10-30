using CSV, DataFrames, Statistics, StatsBase, Random, Dates

######
#data#
######
df = CSV.File("data/names.csv") |> DataFrame

############
#parameters#
############

n = 30 
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
S2 = 99999
a = 0.03
b = 0.07 


#################
#generating data#
#################

# Generate a random index
random_index = rand(1:size(df, 1))

# sample based on index 
randomIndices = sample(1:size(df,1),n ,replace=false)
Beneficiary = df[randomIndices,:]

#generate age and salary 
Salary = rand(minSal:maxSal,n)
Age = rand(workingAge:legalRetAge, n)


################
# service time #
################

DOB = Date.(Dates.year(BOY) .- Age, rand(1:12,n), rand(1:28,n))

PBE = []  #period before entry 
for i in Age 
    perBefEnt = rand(workingAge:i)
    append!(PBE,perBefEnt)
end 

DOE  = Date.(Dates.year.(DOB) .+ PBE, rand(1:12,n), rand(1:28,n))
tx = rand([1,1,1,1,1,0.8,0.8,0.5],n)

pst =  Dates.year.(BOY) .- Dates.year.(DOE)

Beneficiary[:, "age"] = Age
Beneficiary[:, "DOB"] = DOB 
Beneficiary[:,"DOE"] = DOE
Beneficiary[:, "salary"] = Salary 
Beneficiary[:, "pst"] = pst
Beneficiary[:, "tst"] = pst .+ legalRetAge .- workingAge
Beneficiary[:,"tx"] = tx



Beneficiary