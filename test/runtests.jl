using VesselUnits
using Test

@testset "VesselUnits.jl" begin
    @test isdefined(@__MODULE__, :inch)
    @test (25.4mm |> inch) ≈ 1inch
end
