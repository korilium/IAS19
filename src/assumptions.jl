using MortalityTables, DataFrames

discRate = 0.035
infRate = 0.02 
salIncr = 0.005
withRate= [1:5, 0.10]


mort = MortalityTables.table(897)

mort.ultimate[50]



## Turnover table 

age =  25:65



percentages= [15,10,5,2,0]

counts = [5,5,5,5,20]
df_TO = DataFrame()

df_TO[:, "age"] = age

TO = []
for (percentage, count) in zip(percentages, counts)

end
df_TO[!;[:]]