module PhotonX
"""
    PhotonX.jl:
        A Comprehensive Julia Framework designed for Computational Photonics. The numerical
        methods implemented in this package was developed for experimental purposes, although
        it also provides a solid framework for theoretical studies. A basic documentation is
        available as docstrings, however we widely encourage users to explore the availabele
        examples provided at:
            <https://github.com/carlos-antunis-physics/PhotonX.jl/tree/main/examples/>
        The package is under active development, and contributions are welcome.

        available submodules:
            - Classical: Classical Photonics
            - Quantum: Quantum Photonics
            - Waveguide: Waveguide design and analysis
            - Utils: Utilitaries for Computational Photonics

    author: Carlos Antunis

    version: 0.1.0
"""
    __precompile__();

    __version__ = v"0.1.0";

    export __version__;

    Classical = include("Classical/Classical.jl");
    Quantum = include("Quantum/Quantum.jl");

    Waveguide = include("Waveguide/Waveguide.jl");

    Utils = include("Utils.jl");

    
end # module PhotonX