module PhotonX
    """
        PhotonX.jl:
            A Comprehensive Julia Framework designed for Computational Photonics. The numerical
            methods implemented in this package was developed for experimentalists, although it
            also provides a solid framework for theoretical studies. A simple documentation is
            available as docstrings, however we widely encourage users to explore the available
            examples provided at:
                <https://github.com/carlos-antunis-physics/PhotonX.jl/tree/main/examples/>
            The package is under active development, and contributions are welcome.

            available submodules:
                - Mode: Classical and Quantum mode design and propagation
                - Waveguide: Waveguide design and analysis

        author: Carlos Antunis [github.com/carlos-antunis-physics]
    """

    __precompile__()
    __version__ = v"0.1.0"

    """
        PhotonX.jl submodules
    """

    const Modes = include("Modes/__module__.jl")
    const Waveguides = include("Waveguides/__module__.jl")

    # Exporting the main components of the package
    export __version__, Modes, Waveguides

end
