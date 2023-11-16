

"""
    TO()

gives you a turnover table to use a turnover at specific age ranges
You can define the age range, the turnover rate and how long this needs to be aplied 
note that the sum of the counts should equal the range of the age 

# example 

```julia-repl
julia> TO()
```
"""
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