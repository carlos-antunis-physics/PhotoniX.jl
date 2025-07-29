module Modes

    __precompile__();
    using Symbolics;
    using ClassicalOrthogonalPolynomials: laguerrel as L, hermiteh as H;
    using SpecialFunctions: besselj as J;

    export Propagation;

    """
        PhotoniX.Modes submodules
    """

    const Propagation = include("Propagation.jl");

    struct __Mode_t__
        __expression__ :: Symbolics.Num
        __substitutions__ :: Dict{Symbol, Float64}
    end

end