
using CSV, DataFrames, Statistics, StatsBase, Random, Dates

include("../src/functions.jl")
######
#data#
######
df = CSV.File("data/data2023.csv") |> DataFrame




#######################
### first iteration ###
#######################

