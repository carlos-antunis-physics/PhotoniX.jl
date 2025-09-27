module Mode
    export Propagation, gauss, hermite_gauss, laguerre_gauss, bessel;

    using ClassicalOrthogonalPolynomials: hermiteh, laguerrel;
    using SpecialFunctions: besselj;
    using Symbolics;
    using Latexify: latexify;

    """
        Mode.jl submodules
    """

    const Propagation = include("Propagation.jl");

    """
        Optical modes data structure prototyping
    """

    struct mode_t
        _field :: Union{<:Function}
        _symmetry :: Symbol
    end

    Base.show(io::IO, ψ::mode_t) = begin
        @variables x y r θ;

        (ψ._symmetry == :rectangular) ?
            show(io,  ψ._field(x, y)) : show(io,  ψ._field(r, θ));
    end
    Base.show(io::IO, ::MIME"text/latex", ψ::mode_t) = begin
        @variables x y r θ;

        (ψ._symmetry == :rectangular) ?
            println(io, "\$\$" * latexify(ψ._field(x, y)) * "\$\$") :
            println(io, "\$\$" * latexify(ψ._field(r, θ)) * "\$\$");
    end

    function (ψ :: mode_t)(xs::AbstractVector, ys::AbstractVector)
        if ψ._symmetry == :rectangular
            X, Y = [x for x in xs, _ in ys], [y for _ in xs, y in ys];
            return @. ψ._field.(X, Y);
        else #if ψ._symmetry == :polar
            R, Θ = [sqrt(x^2 + y^2) for x in xs, y in ys], [angle(x + 1im*y) for x in xs, y in ys];
            return @. ψ._field.(R, Θ);
        end
    end

    """
        Fundamental optical modes at focal plane (z = 0μm)
    """

    gaussian(w0) = begin
        A = sqrt(2 / (pi * w0^2));
        
        u(r, θ) = A * exp(-r^2 / w0^2);
        
        return mode_t(u, :polar);
    end;

    laguerre_gauss(w0, l :: Int64, p :: Int64 = 0) = begin
        _l = abs(l);
        A = sqrt(2 * factorial(p) / (π * w0^2 * factorial(p + _l)));
        a = sqrt(2) / w0;
        a² = a^2;
        w0² = w0^2;

        u_lp(r, θ) = A * (a*r)^_l * laguerrel(p, _l, a²*r^2) * exp(-r^2/w0²) * exp(1im*l*θ);

        return mode_t(u_lp, :polar);
    end;

    hermite_gauss(w0, m :: Int64, n :: Int64) = begin
        A = sqrt(2 / (π * w0^2 * 2^(m + n) * factorial(m) * factorial(n)));
        a = sqrt(2) / w0;
        w0² = w0^2;

        u_lp(x, y) = A * hermiteh(m, a*x)* hermiteh(n, a*y) * exp(-x^2/w0²) * exp(-y^2/w0²);

        return mode_t(u_lp, :rectangular);
    end;

    bessel(κ, m :: Int64) = begin
        u_m(r, θ) = besselj(m, κ*r) * exp(1im*m*θ);

        return mode_t(u_m, :polar);
    end;
end