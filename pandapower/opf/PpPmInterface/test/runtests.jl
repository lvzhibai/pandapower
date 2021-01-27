using PowerModels
using PpPmInterface
import Gurobi
using Test

testfile = "pm_test.json"
@testset "PpPmInterface.jl" begin
        for i in ("","_tnep","_powerflow","_ots","_mn_storage")
                include("../src/pm_models/run_powermodels"*i*".jl")
                comm = "run_powermodels"*i*"(testfile)"
                result=eval(Meta.parse(comm))
                @test typeof(result)==Dict{String,Any}
                @test result["solve_time"]>=0
        end
end
