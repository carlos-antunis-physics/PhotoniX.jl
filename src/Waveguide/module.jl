module Waveguide

    number_t = Union{Float64, Int64};
    function_t = Union{<:Function};

    function straight(
        Δn :: number_t, κ :: function_t,
        r_i = (0., 0.), r_f = (0., 0.),
        zi = -Inf64, zf = +Inf64
    )
        v_x, v_y = (r_f .- r_i) ./ (zf - zi);
        if zi == -Inf64 && zf == +Inf64
            return (x, y, z) -> begin
                X = [x - v_x * z for x in x, _ in y];
                Y = [y - v_y * z for _ in x, y in y];
                return @. Δn * κ(X, Y, z);
            end
        elseif zi == -Inf64
        return (x, y, z) -> begin
            X = [x - v_x * z for x in x, _ in y]
            Y = [y - v_y * z for _ in x, y in y]
                return @. (z ≤ zf) ? Δn * κ(X, Y, z) : 0.0;
            end
        elseif zf == +Inf64
            return (x, y, z) -> begin
                X = [x - v_x * z for x in x, _ in y];
                Y = [y - v_y * z for _ in x, y in y];
                return @. (zi ≤ z) ? Δn * κ(X, Y, z) : 0.0;
            end
        else
            zm, halfΔz = (zi + zf)/2, .5abs(zf - zi);
            return (x, y, z) -> begin
                X = [x - v_x * z for x in x, _ in y];
                Y = [y - v_y * z for _ in x, y in y];
                return @. (abs(z - zm) ≤ halfΔz) ? Δn * κ(X, Y, z) : 0.0;
            end
        end
    end

    """
        Waveguide.jl submodule
    """

    Utils = include("Utils.jl");

end