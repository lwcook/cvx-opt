module TestProblems

function rosenbrock(x::Array)

    if length(x) % 2 == 0
        sum = 0
        a = 100
        b = 1

        for i in 1:1:convert(Int, length(x)/2)
            sum += a*(x[2i-1]^2 - x[2i])^2 + (x[2i-1] - 1)^2
        end
        return sum
    else
        e = ErrorException("Length of x is not even")
        throw(e)
    end

end

export rosenbrock

end
