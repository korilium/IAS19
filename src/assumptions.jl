using MortalityTables

discRate = 0.035
infRate = 0.02 
salIncr = 0.005
withRate= [1:5, 0.10]


mort = MortalityTables.table(897)

mort.ultimate[50]
