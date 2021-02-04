using PowerModels
using PpPmInterface
using Test

test_net="pm_test.json"
test_ipopt = "test_ipopt.json"
test_Gurobi = "test_Gurobi.json" #use gurobi to solve
@testset "PpPmInterface.jl" begin
        # for i in ["","_ots","_powerflow","_tnep"]
        #         comm="run_powermodels"*i*"(test_ipopt)"
        #         result=Meta.parse($comm)
        #         @test typeof(result)==Dict{String,Any}
        #         @test result["solve_time"]>=0
        # end
        result=run_powermodels(test_ipopt)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        # result=run_powermodels_mn_storage(test_Gurobi)
        # @test typeof(result)==Dict{String,Any}
        # @test result["solve_time"]>=0
        result=run_powermodels_ots(test_net) #use Gurobi
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        result=run_powermodels_powerflow(test_ipopt)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
        result=run_powermodels_tnep(test_ipopt)
        @test typeof(result)==Dict{String,Any}
        @test result["solve_time"]>=0
end
