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

end