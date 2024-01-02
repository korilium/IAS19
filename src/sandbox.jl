
using   CSV, 
        DataFrames, 
        Statistics, 
        StatsBase, 
        Random, 
        Dates, 
        LifeContingencies, 
        MortalityTables, 
        FinanceModels

include("../src/functions.jl")
include("../src/assumptions.jl")

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



life= SingleLife(mk(age))

yield = FinanceModels.Yield.Constant(DR)
lc = LifeContingency(life,yield )


ins= Insurance(lc)
collect(cashflows(ins))
survival(ins)


#######################
### first iteration/ normal evaluation ###
#######################

