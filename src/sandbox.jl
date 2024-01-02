
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

age= 35:45



vbt2001 = MortalityTables.table("2001 VBT Residual Standard Select and Ultimate - Male Nonsmoker, ANB")

issue_age = 30
life = SingleLife(                 # The life underlying the risk
    mortality = vbt2001.select[issue_age],    # -- Mortality rates
)

life= SingleLife(mk(age))

yield = FinanceModels.Yield.Constant(DR)
lc = LifeContingency(life,yield )


ins= Insurance(lc)
collect(cashflows(ins))
survival(ins)


#######################
### first iteration/ normal evaluation ###
#######################

