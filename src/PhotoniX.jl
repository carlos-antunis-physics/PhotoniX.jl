module PhotoniX
    """
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
        *   Mode
            Algorithms for photonic modes algebraic and numerical treatment in paraxial
            regime.
            *   Mode.Holography
                Numerical algorithms for holography generation and reconstruction of
                optical fields.
            *   Mode.Propagation
                Numerical algorithms for estimating the propagation of modes in the
                paraxial regime.
        *   Circuit
            Algorithms for photonic circuit construction, and algebraic or numerical
            simulation in paraxial regime.
            *   Circuit.Waveguide
                Waveguide data structure prototyping.
                *   Circuit.Waveguide.Utils
                    Waveguide structure utils, such as standard waveguide bending and
                    refractive index profiles.
            *   Circuit.Algebra
                Creation and annihilation operators formalism for photonic circuits
                design in paraxial regime.

        Author: Carlos Antunis [github.com/carlos-antunis-physics]

    """

    export __version__, Modes, Waveguides;

    __version__ = v"0.1.0";

    """
        PhotoniX.jl submodules
    """

    const Modes = include("Mode/__init__.jl");
    const Circuit = include("Circuit/__init__.jl");

end