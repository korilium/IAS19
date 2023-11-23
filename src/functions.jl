

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



"""
    MortBel() 

Gives you the makeham Mortality following the parametrization described in the Belgium law 
These Makeham Mortality hazard function are used to compute the survival rate for a give age
    
# example
```julia-repl
julia> using MortalityTables
julia> m = MortBel() 
julia> survival(m, 20, 65)
```    


"""


function MortBel(type ="MK")

    if type == "MR"   
        ########
        ##-MR-##
        ########
        k = 1000266.63
        s = 0.999441703848
        g = 0.999733441115
        c = 1.101077536030

    elseif type == "FR"
        ########
        ##-FR-##
        ########
        k = 1000048.56
        s = 0.999669730966
        g = 0.999951440172
        c = 1.116792453830

    elseif type == "MK"
        ########
        ##-MK-##
        ########
        k = 1000450.59
        s = 0.999106875782
        g = 0.999549614043
        c = 1.103798111448
    else 
        ########
        ##-FK-##
        ########
        k = 1000097.39
        s = 0.999257048061
        g = 0.999902624311
        c = 1.118239062025
    end 

    λ = -log(s)
    α = -log(g)
    β =  log(c)
    return MortalityTables.Makeham(a=α,b=β,c=λ   )
end 