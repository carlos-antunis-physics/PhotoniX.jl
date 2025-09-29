module Mode
    export gaussian, hermite_gauss, laguerre_gauss, bessel, ⊙;

    using ClassicalOrthogonalPolynomials: hermiteh, laguerrel;
    using SpecialFunctions: besselj;

    number_t = Union{Float64, Int64};
    coordinate_t = AbstractArray{<:number_t, 1};
    mode_t = Matrix{Union{ComplexF64, Float64}};

    ⊙(ϕ :: mode_t, ψ :: mode_t) = begin
        """
            PhotoniX.Mode.inner:

                Returns the inner product between given modes evaluated on transverse
                plane.

            @parameters:
                ϕ :: mode_t
                    Basis function evaluated on transverse plane.
                ψ :: mode_t
                    State function evaluated on transverse plane.
        """
        return round(sum(conj.(ϕ) .* ψ), digits = 8);
    end

    """
        Optical modes at transverse plane (z = 0μm)
    """

    function gaussian(w0 ::number_t, X :: coordinate_t, Y :: coordinate_t)
        """
            PhotoniX.Mode.gaussian(w0, X, Y):

                Returns the gaussian mode profile evaluated at the XY region of
                transverse plane.

            @parameters:
                w0 :: number_t
                    The waist of the gaussian mode at focal plane (z = 0μm).
                X :: coordinate_t
                    The X coordinates of the grid points.
                Y :: coordinate_t
                    The Y coordinates of the grid points.
        """
        _x, _y = X ./ w0, Y ./ w0;
        r² = [(x^2 + y^2) for x in _x, y in _y];

        A = sqrt(2 / (π * w0^2));

        return @. A * exp(-r²);
    end

    function laguerreGauss(w0 ::number_t, l :: Int64, X :: coordinate_t, Y :: coordinate_t, p :: Int64 = 0)
        """
            PhotoniX.Mode.laguerreGauss(w0, l, X, Y; p = 0):

                Returns the laguerre-gaussian mode profile evaluated at the XY region
                of transverse plane.

            @parameters:
                w0 :: number_t
                    The waist of the laguerre-gaussian mode at focal plane (z = 0μm).
                l :: Int64
                    The topological charge of the Laguerre-Gaussian mode.
                X :: coordinate_t
                    The X coordinates of the grid points.
                Y :: coordinate_t
                    The Y coordinates of the grid points.
                p :: Int64 = 0
                    The radial charge of the laguerre-gaussian mode.
        """
        _l, _s = abs(l), sign(l);
        _sqrt2 = sqrt(2);

        _x, _y = [x / w0 for x in X, _ in Y], [y / w0 for _ in X, y in Y];
        z = @. (_sqrt2 * (_x + 1im*_s*_y))^_l;
        r² = @. (_x^2 + _y^2);

        A = sqrt(2 * factorial(p) / (π * w0^2 * factorial(p + _l)));

        return @. A * z * laguerrel(p, _l, 2r²) * exp(-r²);
    end

    function hermiteGauss(w0 ::number_t, m :: Int64, n :: Int64, X :: coordinate_t, Y :: coordinate_t)
        """
            PhotoniX.Mode.hermiteGauss(w0, m, n, X, Y):

                Returns the hermite-gaussian mode profile evaluated at the XY region
                of transverse plane.

            @parameters:
                w0 :: number_t
                    The waist of the hermite-gaussian mode at focal plane (z = 0μm).
                m :: Int64
                    The mode order in the X direction.
                n :: Int64
                    The mode order in the Y direction.
                X :: coordinate_t
                    The X coordinates of the grid points.
                Y :: coordinate_t
                    The Y coordinates of the grid points.
        """
        _sqrt2 = sqrt(2);

        _x, _y = [x / w0 for x in X, _ in Y], [y / w0 for _ in X, y in Y];
        r² = @.  (_x^2 + _y^2);

        A = sqrt(2 / (π * w0^2 * 2^(m + n) * factorial(m) * factorial(n)));

        return @. A * hermiteh(m, _sqrt2 * _x) * hermiteh(n, _sqrt2 * _y) * exp(-r²);
    end

    function bessel(κ ::number_t, m :: Int64, X :: coordinate_t, Y :: coordinate_t)
        """
            PhotoniX.Mode.bessel(κ, m, X, Y):

                Returns the bessel mode profile evaluated at the XY region of
                transverse plane.

            @parameters:
                κ :: number_t
                    The transverse wave number of the bessel mode.
                m :: Int64
                    The radial mode order of bessel function.
                X :: coordinate_t
                    The X coordinates of the grid points.
                Y :: coordinate_t
                    The Y coordinates of the grid points.
        """
        _x, _y = [x / w0 for x in X, _ in Y], [y / w0 for _ in X, y in Y];

        r = @.  sqrt(_x^2 + _y^2);
        θ = @.  angle(_x + 1im*_y);

        return @. besselj(m, κ * r) * exp(1im * m * θ);
    end

end