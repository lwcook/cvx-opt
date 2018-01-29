include("testproblems.jl")
import TestProblems.rosenbrock

println(TestProblems.rosenbrock([2, 4]))

function finiteDiff(func::Function, x::Array)

    xBase = copy(x)
    fBase = func(xBase)
    gradient = Array{Float32}(length(x))
    step = 1e-6
    for ii in 1:1:length(x)
        xi = copy(x)
        xi[ii] += step
        fi = func(xi)
        gradient[ii] = (fi - fBase) / step
    end

    return gradient::Array


end

function steepestDescent(obj_func::Function, x0::Array)

    convergence = Inf
    tol = 1e-5
    x = x0
    f = obj_func(x0)
    num_iters = 0

    while convergence > tol && num_iters < 100

        search_dir = finiteDiff(obj_func, x)
        function obj_func1D(step_length::Float32)
            return obj_func(x + (step_length * search_dir))
        end

        num_iters += 1
        println(num_iters)

    end

end

steepestDescent(TestProblems.rosenbrock, [4., 4., 2., 3.])
