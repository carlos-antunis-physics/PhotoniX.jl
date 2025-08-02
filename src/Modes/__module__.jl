module Modes

    __precompile__();

    using Symbolics;
    using ClassicalOrthogonalPolynomials: laguerrel, hermiteh;
    using SpecialFunctions: besselj;

    export Propagation, hermite_gauss, laguerre_gauss, bessel;

    hermite_gauss(w₀::Float64, m::Int, n::Int) = begin
        @variables x y;
        
        hermitehe(l, u) = (1/2)^(n/2) * hermiteh(l, u / sqrt(2));

        Hₘ(u) = hermiteh(m, sqrt(2) * u / w₀);
        Hₙ(u) = hermiteh(n, sqrt(2) * u / w₀);

        return Complex{Num}(Hₘ(x) * Hₙ(y) * exp(-(x^2 + y^2) / w₀^2));
    end

    laguerre_gauss(w₀::Float64, l::Int, p::Int = 0) = begin
        @variables r ϕ;

        Lˡₚ(u) = laguerrel(p, l, 2u^2 / w₀^2);
        ll, sl = abs(l), sign(l);

        return Complex{Num}((r / w₀) ^ ll * (cos(ll * ϕ) + 1im * sl * sin(ll * ϕ)) * Lˡₚ(r) * exp(-r^2 / w₀^2));
    end

    bessel(κₜ::Float64, m::Int) = begin
        @variables r ϕ;

        return Complex{Num}(Symbolics.besselj(m, κₜ * r) * exp(1im * m * ϕ));
    end

    function (Ψ::Complex{Num})(X::LinRange, Y::LinRange)
        @variables x y r ϕ;

        #   Symbolic function handler
        ψ(u, v) = begin
            z = u + 1im*v;
            return substitute(
                substitute(Ψ, Symbolics.besselj => besselj),
                Dict(x => u, y => v, r => abs(z), ϕ => angle(z))
            );
        end

        #   Convert to complex numbers
        __ComplexF64__(ψ) = ComplexF64(real(ψ).val, imag(ψ).val);

        return [__ComplexF64__(ψ(u, v)) for u in X, v in Y];
    end

    const Propagation = include("Propagation.jl");

end