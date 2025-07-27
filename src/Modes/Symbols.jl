module Symbols

    __precompile__()

    using Symbolics

    @variables λ :: Real, κ :: Real

    @variables w0 :: Real
    @variables z0 :: Real

    @variables W(..)::Real, R(..)::Real, Φ(..)::Real

    export W, R, Φ, w0, κ, λ, z0

end