
using   CSV, 
        DataFrames, 
        Statistics, 
        StatsBase, 
        Random, 
        Dates, 
        LifeContingencies

include("../src/functions.jl")
######
#data#
######
df = CSV.File("data/data2023.csv") |> DataFrame

#############
# Mortality #
#############

mk = MortBel("MK")
fk = MortBel("FK")
mr= MortBel("MR")
fr= MortBel("FR")



#################
### test case ###
#################

age= 35 



SingleLife(mk(age))


#######################
### first iteration ###
#######################

