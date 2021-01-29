using PowerModels
using PpPmInterface
using Test

# include("../src/pm_models/run_powermodels.jl")
# include("../src/pm_models/run_powermodels_mn_storage.jl")
# include("../src/pm_models/run_powermodels_ots.jl")
# include("../src/pm_models/run_powermodels_powerflow.jl")
# include("../src/pm_models/run_powermodels_tnep.jl")

testfile = "pm_test.json" #use gurobi to solve
@testset "PpPmInterface.jl" begin
        result=run_powermodels(testfile)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        # result=run_powermodels_mn_storage(testfile)
        # @test typeof(result)==Dict{String,Any}
        # @test result["solve_time"]>=0
        result=run_powermodels_ots(testfile)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        result=run_powermodels_powerflow(testfile)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        result=run_powermodels_tnep(testfile)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
end
