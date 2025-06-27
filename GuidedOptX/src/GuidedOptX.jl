module GuidedOptX
#   GuidedOptX.jl:
#       A computational toolkit for guided wave optics.
#
#   This module provides a full framework for analytical and numerical studies on
#   optical waveguides and nonlinear effects on light propagation.
#
#   author:
#     Carlos Antunis Bonfim da Silva Santos <crlsantnys+github@gmail.com>

__version__ = "1.0.0";

try
    @eval using GLMakie
    println("Using GLMakie for visualization.")
catch
    try
        @eval using CairoMakie
        println("Using CairoMakie for visualization.")
    catch
        error("Please install either GLMakie or CairoMakie.")
    end
end

end # module GuidedOptX
