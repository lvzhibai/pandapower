module PpPmInterface

import JuMP
import JSON

using PowerModels
using Cbc
using Ipopt
using Juniper

using Gurobi

include("input/pp_to_pm.jl")
export load_pm_from_json, get_model, get_solver
#
# try
#     using Gurobi
# catch e
#     if isa(e, LoadError)
#         println("Cannot import Gurobi. That's fine if you do not plan to use it")
#     end
# end
#
# try
#     using KNITRO
# catch e
#     if isa(e, LoadError)
#         println("Cannot import KNITRO. That's fine if you do not plan to use it")
#     end
# end
#
# try
#     using SCIP
# catch e
#     if isa(e, LoadError)
#         println("Cannot import SCIP. That's fine if you do not plan to use it")
#     end
# end

end
