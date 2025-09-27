module Mode
    export Holography, Propagation, G;
    
    using ClassicalOrthogonalPolynomials: hermiteh as hermite, laguerrel as laguerre;
    using SpecialFunctions: besselj as bessel;
    using Symbolics;
    using Latexify: latexify;

    """
        Mode.jl submodules
    """

    include("Holography.jl");
    include("Propagation/__init__.jl");

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

    G(w0) = mode_t((x, y) -> exp(-(x^2 + y^2) / w0^2), :rectangular);

end