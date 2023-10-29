using CSV, DataFrames, Statistics, StatsBase, Random

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
workingAge = 18 
legalRetirmentAge = 67 
newPlan = 1 

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

randomIndices = sample(1:length, n ,replace=false)

Beneficiary = df[randomIndices,:]

Salary = rand(minSal:maxSal,n)
Age = rand(workingAge:legalRetirmentAge, n)
tx = rand([1,1,1,0.8,0.5],n)


if newPlan == 0 
    pst = []
    for age in Age 
        proportion = rand()
        chance1= rand()
        chance2 = rand()
        if (proportion > chance1) & (proportion > chance2) 
            Pst = (age - workingAge) * proportion
        else 
            Pst = age - workingAge
        end 
        Pst = round(Pst, digits = 2)
        push!(pst, Pst)
    end 
else
    Beneficiary[:, "pst"] .= 0
end 

Beneficiary[:, "tst"] = .- pst .+ legalRetirmentAge .- workingAge
Beneficiary[:,"tx"] = tx
Beneficiary[:, "salary"] = Salary 
Beneficiary[:, "age"] = Age


Beneficiary