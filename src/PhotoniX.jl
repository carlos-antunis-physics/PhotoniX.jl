module PhotoniX
    @doc raw"""

        PhotoniX.jl:
            A comprehensive Julia lang framework designed for computational photonics.
            The package implements numerical and algebraic utils mainly designed for
            experimentalists, providing also a solid basis for theoretical studies in
            photonics. A simple documentation was implemented as docstrings, although
            users are widely encouraged to explore the available examples provided at:
                <https://github.com/carlos-antunis-physics/PhotoniX.jl/>
            The package is under active development, and contributions are welcome.

        Version: 1.0.0

        Available submodules:
        *   Mode
                Functions to evaluate classical structured light in paraxial regime
                along the transverse plane on the focal region.
        *   Waveguide
                Waveguide constructors for several transverse profiles and bending
                along the propagation axis.
        *   QuantumAlgebra
                Creation and annihilation operators formalism for simulating quantum
                aspects of photonic circuits.

        Author:
            Carlos Antunis <https://github.com/carlos-antunis-physics>

    """

    export __version__, Mode, Waveguide, QuantumAlgebra;

    __version__ = v"1.0.0";

    """
        PhotoniX.jl submodules
    """

    const Mode = include("Mode/module.jl");
    const Waveguide = include("Waveguide/module.jl");
    const QuantumAlgebra = include("QuantumAlgebra/module.jl");

end