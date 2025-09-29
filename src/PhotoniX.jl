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
                Constructors and utils for design transverse profiles of optical
                waveguides and bending along the propagation axis.
        *   QuantumAlgebra
                Creation and annihilation operators formalism for simulating quantum
                aspects of photonic circuits.

        Author:
            Carlos Antunis <https://github.com/carlos-antunis-physics>

    """

    export __version__, Mode, Waveguide, QuantumAlgebra;

    using FFTW;

    __version__ = v"1.0.0";

    """
        PhotoniX.jl submodules
    """

    Mode = include("Mode/module.jl");
    Waveguide = include("Waveguide/module.jl");
    QuantumAlgebra = include("QuantumAlgebra/module.jl");

    """
        PhotoniX.jl main module
    """

    number_t = Union{Float64, Int64};
    coordinate_t = AbstractArray{<:number_t, 1};

    function splitStep(
        Ψ :: Mode.mode_t,
        n0 :: number_t,
        λ :: number_t,
        X :: coordinate_t, Y :: coordinate_t,
        z :: number_t, Δz :: number_t,
        Δn :: AbstractArray{Waveguide.waveguide_t, 1},
    )

    end
end