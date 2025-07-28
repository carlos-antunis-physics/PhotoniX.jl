module Waveguides

    __precompile__();
    export Utils, Design;

    """
        PhotoniX.Waveguides submodules
    """

    const Utils = include("Utils.jl");
    const Design = include("Design.jl");

end