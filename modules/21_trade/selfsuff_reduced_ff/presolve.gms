pc21_demand_forestry_future(i,kforestry2)    = sum(t_ext$(t_ext.pos = pm_rotation_reg(i)),p21_demand_ext(t_ext,i,kforestry2));
pc21_selfsuff_forestry_future(i,kforestry2)  = sum(t_ext$(t_ext.pos = pm_rotation_reg(i)),p21_selfsuff_ext(t_ext,i,kforestry2));
pc21_trade_bal_reduction_future             = sum(t_ext, im_trade_bal_reduction(t_ext))/card(t_ext);
pc21_trade_balanceflow_future(kforestry2)    = sum(t_ext,p21_trade_balanceflow_ext(t_ext,kforestry2))/card(t_ext);
pc21_exp_shr_future(i,kforestry2)            = sum(t_ext$(t_ext.pos = pm_rotation_reg(i)),p21_exp_shr_ext(t_ext,i,kforestry2));
pcm_production_ratio_future(i)             = sum(t_ext$(t_ext.pos = pm_rotation_reg(i)),pm_production_ratio_ext(i,t_ext));