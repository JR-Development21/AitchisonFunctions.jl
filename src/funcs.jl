include("function_transformation.jl")

function sphere(x, psi)
    function f(x)
       return sum(x.^2)
    end
    return function_transform(f, psi, x)
end

function rastrigin(x, psi)
    function f(x)
        k = length(x)
        A = 10
        return A * k + sum(x.^2 .- A .* cos.(2 .* pi .* x)) 
    end
    return function_transform(f, psi, x)
end

function ackley(x, psi)
    function f(x)
        A = 20
        k = length(x)
        return -A * exp(-.2 * sqrt(sum(x.^2) ./ k)) - exp(1/ k * sum(cos.(2 .* pi .* x))) + 20 + exp(1)
    end
    return function_transform(f, psi, x)
end

function rosenbrock(x, psi)
    function f(x)
        add_num = 0
        k = length(x)
        for i in 1:(k-1)
            add_num += 100 * (x[i + 1] - x[i]^2) + (1 - x[i])^2
        end
        return add_num
    end
    return function_transform(f, psi, x)
end

function weierstrauss(x, psi)
    function f(x)
        a = .5
        b = 3
        kmax = 20
        k = length(x)
        add_num = 0
        for i in 1:k
            for j in 0:kmax
                add_num += a^j * cos(2 * pi * b^j *(x[i] + .5))
            end
        end
        for j in 0:kmax
            add_num += -k * a^j * cos(2 * pi * b^j *.5)
        end
        return add_num
    end
    return function_transform(f, psi, x)
end