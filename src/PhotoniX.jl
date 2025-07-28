module PhotoniX
    raw"""
        PhotoniX.jl:
            A comprehensive Julia lang framework designed for computational photonics.
            The package implements numerical and algebraic utils mainly designed for
            experimentalists, providing also a solid basis for theoretical studies in
            photonics. A simple documentation was implemented as docstrings, although
            users are widely encouraged to explore the available examples provided at:
                <https://github.com/carlos-antunis-physics/PhotoniX.jl/>
            The package is under active development, and contributions are welcome.

        Version: 0.1.0
        
        Available submodules:
        * Modes:
            Classical modes of paraxial light, and quantum simulation algorithms.
            * Propagation:
                Algorithms for approximation of paraxial light propagation.
        * Waveguides:
                Waveguide construction and design and visualization.
                * Design:
                    Algorithms for waveguide design.
                * Symbols:
                    Symbolics of waveguide design and construction.

        Author: Carlos Antunis [github.com/carlos-antunis-physics]

    """

    __precompile__();
    export __version__, Modes, Waveguides;

    __version__ = v"0.1.0";

    """
        PhotoniX.jl submodules
    """

    const Modes = include("Modes/__module__.jl");
    const Waveguides = include("Waveguides/__module__.jl");

end