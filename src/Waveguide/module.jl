module Waveguide
    export
        straight,
        rectangular, gaussian, annular, stepCircular, stepAnnular;

    number_t = Union{Float64, Int64};
    function_t = Union{<:Function};
    coordinate_t = AbstractArray{<:number_t, 1};
    point2d_t = Tuple{<:number_t, <:number_t};

    """
        Waveguides constructors
    """

    waveguide_t = Union{<:Function};

    function straight(
        Δn :: number_t, κ :: function_t,
        zi :: number_t, Δz :: number_t,
        r_i :: point2d_t = (0., 0.),
        r_f :: point2d_t = (0., 0.)
    )
        """
            PhotoniX.Waveguide.straight:

                Returns a straight waveguide transverse profile function along the
                propagation axis.

            @parameters:
                Δn :: number_t
                    The refractive index contrast of the waveguide.
                κ :: function_t
                    The transverse profile function of the waveguide.
                zi :: number_t
                    The initial position of the waveguide along the propagation axis.
                Δz :: number_t
                    The length of the waveguide along the propagation axis.
                r_i :: point2d_t = (0., 0.)
                    The initial position of the waveguide along the transverse plane.
                r_f :: point2d_t = (0., 0.)
                    The final position of the waveguide along the transverse plane.
        """
        v_x, v_y = (r_f .- r_i) ./ Δz;
        halfΔz = .5Δz;
        zm = zi + halfΔz;
        return (x :: coordinate_t, y :: coordinate_t, z :: number_t) -> begin
            X = [x - r_i[1] - v_x * (z - zi) for x in x, _ in y];
            Y = [y - r_i[2] - v_y * (z - zi) for _ in x, y in y];
            return (abs(z - zm) ≤ halfΔz) ?
                Δn * κ.(X, Y, z) :
                zeros(Float64, length(x), length(y));
        end
    end

    """
        Waveguide transverse profile functions
    """

    function rectangular(W_x :: number_t, W_y :: number_t, θ :: number_t = 0.)
        """
            PhotoniX.Waveguide.rectangular:

                Returns the transverse profile function of a rectangular waveguide.

            @parameters:
                W_x :: number_t
                    The width of the waveguide along the rotated x-axis.
                W_y :: number_t
                    The width of the waveguide along the rotated y-axis.
                θ :: number_t
                    The rotation angle of the waveguide with respect to the x-axis.
        """
        return (x :: number_t, y :: number_t, z :: number_t) -> begin
            _x, _y = x * cos(θ) + y * sin(θ), -x * sin(θ) + y * cos(θ);
            return (abs(_x) ≤ W_x/2) * (abs(_y) ≤ W_y/2);
        end
    end

    function gaussian(W :: number_t)
        """
            PhotoniX.Waveguide.gaussian:

                Returns the transverse profile function of a gaussian waveguide.

            @parameters:
                W :: number_t
                    The waist of the waveguide.
        """
        return (x :: number_t, y :: number_t, z :: number_t) -> begin
            return exp(-(x^2 + y^2) / W^2);
        end
    end

    function annular(a :: number_t, W :: number_t)
        """
            PhotoniX.Waveguide.annular:

                Returns the transverse profile function of a annular waveguide.

            @parameters:
                a :: number_t
                    The radius of the waveguide.
                W :: number_t
                    The waist of the waveguide.
        """
        return (x :: number_t, y :: number_t, z :: number_t) -> begin
            r = sqrt(x^2 + y^2);
            return exp(-((r - a)^2) / W^2);
        end
    end

    function stepCircular(a :: number_t)
        """
            PhotoniX.Waveguide.stepCircular:

                Returns the transverse profile function of a step circular waveguide.

            @parameters:
                a :: number_t
                    The radius of the waveguide.
        """
        return (x :: number_t, y :: number_t, z :: number_t) -> begin
            r² = x^2 + y^2;
            return (r² .<= a^2);
        end
    end

    function stepAnnular(a :: number_t, W :: number_t)
        """
            PhotoniX.Waveguide.stepAnnular:

                Returns the transverse profile function of a step annular waveguide.

            @parameters:
                a :: number_t
                    The radius of the waveguide.
                W :: number_t
                    The waist of the waveguide.
        """
        return (x :: number_t, y :: number_t, z :: number_t) -> begin
            Δr = abs(sqrt(x^2 + y^2) - a);
            return (Δr ≤ W/2);
        end
    end

end