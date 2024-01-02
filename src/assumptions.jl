using MortalityTables, DataFrames

DR = 0.035
infl = 0.02 
SI = 0.005
LegCeil = 71519.98	
WAPRate = 0.0175

insured_reserves = 0.02

####################
## Turnover table ##
####################
# create table 
function TO(age= 20:67, percentages=[0.15,0.1,0.1,0.05,0.02,0], counts=[10,5,5,10,18])
    df_TO = DataFrame()
    df_TO[:, "age"] = age
    to = []
    for (percentage, count) in zip(percentages, counts)
        rep = repeat([percentage], count)
        to = vcat(to, rep)
    end
    df_TO[:, "TO"] = to
    return df_TO
end

TO()