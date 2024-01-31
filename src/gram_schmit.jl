include("aitch_operators.jl")

function gs_proc_aitch(vectors, dimension)
    res_mat = zeros(Float64, dimension - 1, dimension)
    for i in 1:(dimension - 1)
        v = vectors[i,]
        if i != 1
            for j in 1:(i-1)
                v = v ./ res_mat[j,1:dimension].^(aitch_inner(res_mat[j,1:dimension], v, dimension) / aitch_norm(res_mat[j,1:dimension])^2)
            end
        end
        v = v.^(1/aitch_norm(v))
        for j in 1:dimension
            res_mat[i,j] = v[j]
        end
    end
    return res_mat
end

function create_basis(dim)
   hold_vec = [[1.0 for x in 1:dim] for y in 1:(dim-1)]
   for i in 1:(dim - 1)
       hold_vec[i][i] = exp(1)
   end
   return hold_vec
end

some = gs_proc_aitch(create_basis(10), 10)

for i in 1:9
    for j in i:9
        inprod = aitch_inner(some[i,1:10], some[j, 1:10], 10)
        println("$i and $j: $inprod")
    end
end


