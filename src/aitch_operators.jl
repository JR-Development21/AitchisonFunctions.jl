function aitch_inner(x, y, dimensions)
    add_num = 0
    for i in 1:dimensions
        for j in 1:dimensions
            add_num = add_num + (log(x[i]) - log(x[j])) * (log(y[i]) - log(y[j]))
        end
    end
    return add_num / (2 * dimensions)
end


function aitch_norm(x)
    D = length(x)
    return sqrt(aitch_inner(x, x, D))
end
