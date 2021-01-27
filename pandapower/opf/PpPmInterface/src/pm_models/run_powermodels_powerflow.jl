using PowerModels
using .PpPmInterface


function run_powermodels_powerflow(json_path)
    pm = PpPmInterface.load_pm_from_json(json_path)

    model = PpPmInterface.get_model(pm["pm_model"])

    solver = PpPmInterface.get_solver(pm["pm_solver"], pm["pm_nl_solver"], pm["pm_mip_solver"],
    pm["pm_log_level"], pm["pm_time_limit"], pm["pm_nl_time_limit"], pm["pm_mip_time_limit"])

    result = PowerModels.run_pf(pm, model, solver)
    # add branch flows
    update_data!(pm, result["solution"])
    flows = calc_branch_flow_ac(pm)
    update_data!(result["solution"], flows)
    return result
end
