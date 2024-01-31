function clr(x)
    D = length(x)
    g_x = exp(1 / D * sum(log.(x)))
    x = log.(x) .- log(g_x)
    return x
end

function function_transform(f, psi, x)
    x_hat = transpose(clr(x)) * psi
    return f(x_hat)
end

function test_func(x)
    return x
end

some = gs_proc_aitch([[exp(1), 1, 1], [1, exp(1), 1]], 3)
some2 = fill(1/3, 3)
psi = hcat(clr.(eachrow(some))...)

function_transform(test_func, psi, some2)