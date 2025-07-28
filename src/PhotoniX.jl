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
            Photonic modes algebraic and numerical treatment algorithms in paraxial
            regime.
            * Modes.Propagation:
                Numerical algorithms for estimating the propagation of modes in the
                paraxial regime.
        * Waveguides:
            Photonic waveguide construction, prototyping and visualization.
            * Waveguides.Utils:
                Waveguide structure utils, such as standard waveguide bending and
                refractive index profiles.
            * Waveguides.Design:
                Physics informed neural-networks for waveguide design.

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