using CSV, DataFrames, Statistics



df = CSV.File("data/cross-verified-database.csv") |> DataFrame

describe(df)
describe(df[:, ["birth"]])


@show names(df)

@show unique(df[:,["birth", "birth_min", "birth_max"]])

df.birth = coalesce(df.birth, df.birth_max)
df.birth = coalesce(df.birth, df.birth_min)

df_names = df[:, ["name"]]

CSV.write("names.csv", df_names)