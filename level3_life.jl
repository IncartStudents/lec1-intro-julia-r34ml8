
module GameOfLife
using Plots

struct _Matrix{T} <: AbstractMatrix{T}
    data::Matrix{T}
end
mutable struct Life
    current_frame::Matrix{Int}
    next_frame::Matrix{Int}
end

function Base.getindex(M::_Matrix, i::Int, j::Int)
    if checkbounds(Bool, M.data, i, j)
        return M.data[i, j]
    else
        return 0
    end
end

function Base.size(M::_Matrix)
    return size(M.data)
end

function step!(state::Life)
    curr = _Matrix(state.current_frame)
    next = state.next_frame
    #neighbors_offset = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    neighbors_submatrix = zeros(Int, 3, 3)
    neighbors_count = zeros(Int, 30, 30)

    #=
    TODO: вместо случайного шума
    реализовать один шаг алгоритма "Игра жизнь"
    =#
    for i in 1:30
        for j in 1:30
            neighbors_submatrix = curr[i - 1:i + 1, j - 1:j + 1]
            neighbors_count[i, j] = sum(neighbors_submatrix)

            if curr[i, j] == 0
                next[i, j] = neighbors_count[i, j] == 3 ? 1 : 0
            else
                next[i, j] = (2 <= neighbors_count[i, j] <= 3) ? 1 : 0
            end
        end
    end

    state.current_frame = state.next_frame
    # Подсказка для граничных условий - тор:
    # julia> mod1(10, 30)
    # 10
    # julia> mod1(31, 30)
    # 1

    return nothing
end

function (@main)(ARGS)
    n = 30
    m = 30
    init = Matrix(rand(0:1, n, m))

    game = Life(init, zeros(n, m))

    anim = @animate for time = 1:100
        step!(game)
        cr = game.current_frame
        heatmap(cr)
    end
    gif(anim, "life.gif", fps = 10)
end

export main

end

using .GameOfLife
GameOfLife.main("")
