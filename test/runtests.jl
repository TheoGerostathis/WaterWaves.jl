using WaterWaves
using Test

@testset "WaterWaves.jl" begin
    # Write your own tests here.
    T = 6.;
    ω = 2π/T;
    g=9.81;
    μ0 = ω^2/g;
    h=1000.;
    kappa = μ0;
    @test waveNumber(0,μ0,h)==kappa
    @test isapprox(waveNumber(0,μ0,h), waveNumberHunt(μ0,h), atol = 1e-12)
    #println(waveNumber(0,μ0,h))
    #println(waveNumberHunt(μ0,h))
    h=0.5
    kappa = sqrt(ω^2/(g*h))
    @test isapprox(waveNumber(0,μ0,h), waveNumberHunt(μ0,h), atol = 1e-11)
    #println(waveNumber(0,μ0,h))
    #println(waveNumberHunt(μ0,h))
end;
