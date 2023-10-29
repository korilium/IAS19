using CSV, DataFrames, Statistics, StatsBase, Random


#data 
df = CSV.File("data/names.csv") |> DataFrame

describe(df)


length = size(df)[1] 

############
#parameters#
############

n = 30 
seedValue = 666
Random.seed!(seedValue)
workingAge = 18 
legalRetirmentAge = 67 
# formula 
S1 = 2100
S2 = 99999






randomIndices = sample(1:length, n ,replace=false)

Beneficiary = df[randomIndices,:]


Age = rand(workingAge:legalRetirmentAge, n)

Beneficiary[:, "age"] = Age

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

Beneficiary[:, "pst"] .= 0

Beneficiary[:, "tst"] = .- pst .+ legalRetirmentAge .- workingAge


Beneficiary


