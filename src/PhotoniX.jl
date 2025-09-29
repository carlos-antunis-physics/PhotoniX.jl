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

        Author:
            Carlos Antunis <https://github.com/carlos-antunis-physics>

    """

    export
        __version__,
        Mode, Waveguide,
        splitStep,
        ⊙;

    using FFTW;

    __version__ = v"1.0.0";

    """
        PhotoniX.jl submodules
    """

    Mode = include("Mode/module.jl");
    Waveguide = include("Waveguide/module.jl");

    """
        PhotoniX.jl main module
    """

    number_t = Union{Float64, Int64};
    coordinate_t = AbstractArray{<:number_t, 1};

    """
        PhotoniX.splitStep:

            Returns the split-step Fourier method propagator for simulating beam
            propagation along the z-axis in presence of optical waveguides.

        @parameters:
            X :: coordinate_t
                The X coordinates of the grid points.
            Y :: coordinate_t
                The Y coordinates of the grid points.
            n0 :: number_t
                The background refractive index of the medium.
            Δn :: AbstractArray{Waveguide.waveguide_t, 1}
                An array containing the transverse profile functions of the
                waveguides along the propagation axis.
    """
    function splitStep(
        X :: coordinate_t, Y :: coordinate_t,
        n0 :: number_t,
        Δn :: AbstractArray{<:Waveguide.waveguide_t, 1} = [(x, y, z) -> 0.0]
    )
        K_x = 2π * fftfreq(length(X), 1 / step(X));
        K_y = 2π * fftfreq(length(Y), 1 / step(Y));
        ∇² = [kx^2 + ky^2 for kx in K_x, ky in K_y];
        G(z) = sum([δn(X, Y, z) for δn in Δn]);
        return (Ψ :: Mode.mode_t, λ :: number_t, z :: number_t, Δz :: number_t) -> begin
            κ0 = 2π / λ;
            κ = κ0 * n0;
            return exp.(-1im * κ0 * G(z) * Δz) .*
                    ifft(exp.(+1im * ∇² / 2κ * Δz) .* fft(Ψ));
        end
    end

    """
        PhotoniX.Mode.inner:

            Returns the inner product between given modes evaluated on transverse
            plane.

        @parameters:
            ϕ :: mode_t
                Basis function evaluated on transverse plane.
            ψ :: mode_t
                State function evaluated on transverse plane.
    """
    ⊙(ϕ :: Mode.mode_t, ψ :: Mode.mode_t) = begin
        return round.(sum(conj.(ϕ) .* ψ), digits = 8);
    end

end