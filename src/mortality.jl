using MortalityTables, Plots


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
    α = -log(g)*log(c)
    β =  log(c)
    return MortalityTables.Makeham(a=α,b=β,c=λ   )
end 


