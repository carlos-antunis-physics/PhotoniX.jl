module Mode
    export Propagation, gauss, hermite_gauss, laguerre_gauss, bessel;

    using ClassicalOrthogonalPolynomials: hermiteh, laguerrel;
    using SpecialFunctions: besselj;
    using Symbolics;
    using Latexify: latexify;
    import Base: +, -, *, /, show;

    """
        Mode.jl submodules
    """

    const Propagation = include("Propagation.jl");

    """
        Optical modes data structure prototyping
    """

    struct mode_t
        _field :: Union{<:Function}
    end

    show(io::IO, ψ::mode_t) = begin
        @variables x y r θ;

        show(io,  ψ._field(x, y, r, θ));
    end
    show(io::IO, ::MIME"text/latex", ψ::mode_t) = begin
        @variables x y r θ;

        println(io, "\$\$" * latexify(ψ._field(x, y, r, θ)) * "\$\$");
    end

    +(u :: mode_t, v :: mode_t) = begin
        return mode_t(
            (x, y, r, θ) -> u._field(x, y, r, θ) + v._field(x, y, r, θ)
        );
    end
    -(u :: mode_t, v :: mode_t) = begin
        return mode_t(
            (x, y, r, θ) -> u._field(x, y, r, θ) - v._field(x, y, r, θ)
        );
    end

    *(a :: Union{Float64, Int64, ComplexF64, Complex{Int64}}, u :: mode_t) = begin
        return mode_t(
            (x, y, r, θ) -> a * u._field(x, y, r, θ)
        );
    end
    /(u :: mode_t, a :: Union{Float64, Int64, ComplexF64, Complex{Int64}}) = begin
        return mode_t(
            (x, y, r, θ) -> (1 / a) * u._field(x, y, r, θ)
        );
    end

    inner(X :: AbstractVector, Y :: AbstractVector) = begin
        __inner__(u :: Union{mode_t, Matrix{ComplexF64}}, v :: Union{mode_t, Matrix{ComplexF64}}) = begin
            if typeof(u) == mode_t
                ψ_u = u(X, Y);
            else
                ψ_u = u;
            end
            if typeof(v) == mode_t
                ψ_v = v(X, Y);
            else
                ψ_v = v;
            end
            dS = step(X) * step(Y);
            return round(sum(conj.(ψ_u) .* ψ_v) * dS, digits = 10);
        end
        return __inner__;
    end

    function (ψ :: mode_t)(X::AbstractVector, Y::AbstractVector)
        X, Y = [x for x in X, _ in Y], [y for _ in X, y in Y];
        R, Θ = sqrt.(X.^2 + Y.^2), angle.(X + 1im*Y);

        return @. ψ._field.(X, Y, R, Θ);
    end

    """
        Fundamental optical modes at focal plane (z = 0μm)
    """

    gaussian(w0 :: Union{Float64, Int64}) = begin
        A = sqrt(2 / (pi * w0^2));

        u(x, y, r, θ) = A * exp(-r^2 / w0^2);

        return mode_t(u);
    end;

    laguerre_gauss(w0 :: Union{Float64, Int64}, l :: Int64, p :: Int64 = 0) = begin
        _l = abs(l);
        A = sqrt(2 * factorial(p) / (π * w0^2 * factorial(p + _l)));
        a = sqrt(2) / w0;
        a² = a^2;
        w0² = w0^2;

        u_lp(x, y, r, θ) = A * (a*r)^_l * laguerrel(p, _l, a²*r^2) * exp(-r^2/w0²) * exp(1im*l*θ);

        return mode_t(u_lp);
    end;

    hermite_gauss(w0 :: Union{Float64, Int64}, m :: Int64, n :: Int64) = begin
        A = sqrt(2 / (π * w0^2 * 2^(m + n) * factorial(m) * factorial(n)));
        a = sqrt(2) / w0;
        w0² = w0^2;

        u_lp(x, y, r, θ) = A * hermiteh(m, a*x)* hermiteh(n, a*y) * exp(-x^2/w0²) * exp(-y^2/w0²);

        return mode_t(u_lp);
    end;

    bessel(κ :: Union{Float64, Int64}, m :: Int64) = begin
        u_m(x, y, r, θ) = besselj(m, κ*r) * exp(1im*m*θ);

        return mode_t(u_m);
    end;
end