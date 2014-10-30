-------------------------------------------------------------------------------
--
-- (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Project    : Series-7 Integrated Block for PCI Express
-- File       : pcieCore.vho
-- Version    : 1.11
----
--------------------------------------------------------------------------------
-- The following must be inserted into your VHDL file for this
-- core to be instantiated. Change the instance name and port connections
-- (in parentheses) to your own signal names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
  YourInstanceName : pcieCore  port map(
  --------------------------------------------------------------------------------------------------------------------
  -- 1. PCI Express (pci_exp) Interface                                                                             --
  --------------------------------------------------------------------------------------------------------------------
  --TX
  pci_exp_txp                               => pci_exp_txp,
  pci_exp_txn                               => pci_exp_txn,
  -- RX
  pci_exp_rxp                               => pci_exp_rxp,
  pci_exp_rxn                               => pci_exp_rxn,

  -------------------------------------------------------------------------------------------------------------------
  -- 2. Clocking Interface - For Partial Reconfig Support                                                          --
  -------------------------------------------------------------------------------------------------------------------
  PIPE_PCLK_IN                               => PIPE_PCLK_IN,
  PIPE_RXUSRCLK_IN                           => PIPE_RXUSRCLK_IN,
  PIPE_RXOUTCLK_IN                           => PIPE_RXOUTCLK_IN,
  PIPE_DCLK_IN                               => PIPE_DCLK_IN,
  PIPE_USERCLK1_IN                           => PIPE_USERCLK1_IN,
  PIPE_USERCLK2_IN                           => PIPE_USERCLK2_IN,
  PIPE_OOBCLK_IN                             => PIPE_OOBCLK_IN,
  PIPE_MMCM_LOCK_IN                          => PIPE_MMCM_LOCK_IN,
  PIPE_TXOUTCLK_OUT                          => PIPE_TXOUTCLK_OUT,
  PIPE_RXOUTCLK_OUT                          => PIPE_RXOUTCLK_OUT,
  PIPE_PCLK_SEL_OUT                          => PIPE_PCLK_SEL_OUT,
  PIPE_GEN3_OUT                              => PIPE_GEN3_OUT,

  -------------------------------------------------------------------------------------------------------------------
  -- 3. AXI-S Interface                                                                                            --
  -------------------------------------------------------------------------------------------------------------------
  -- Common
  user_clk_out                               => user_clk ,
  user_reset_out                             => user_reset,
  user_lnk_up                                => user_lnk_up,

  -- TX
  tx_buf_av                                  => tx_buf_av ,
  tx_cfg_req                                 => tx_cfg_req ,
  tx_err_drop                                => tx_err_drop ,
  s_axis_tx_tready                           => s_axis_tx_tready ,
  s_axis_tx_tdata                            => s_axis_tx_tdata ,
  s_axis_tx_tkeep                            => s_axis_tx_tkeep ,
  s_axis_tx_tlast                            => s_axis_tx_tlast ,
  s_axis_tx_tvalid                           => s_axis_tx_tvalid ,
  s_axis_tx_tuser                            => s_axis_tx_tuser,
  tx_cfg_gnt                                 => tx_cfg_gnt ,

  -- RX
  m_axis_rx_tdata                            => m_axis_rx_tdata ,
  m_axis_rx_tkeep                            => m_axis_rx_tkeep ,
  m_axis_rx_tlast                            => m_axis_rx_tlast ,
  m_axis_rx_tvalid                           => m_axis_rx_tvalid ,
  m_axis_rx_tready                           => m_axis_rx_tready ,
  m_axis_rx_tuser                            => m_axis_rx_tuser,
  rx_np_ok                                   => rx_np_ok ,
  rx_np_req                                  => rx_np_req ,

  -- Flow Control
  fc_cpld                                    => fc_cpld ,
  fc_cplh                                    => fc_cplh ,
  fc_npd                                     => fc_npd ,
  fc_nph                                     => fc_nph ,
  fc_pd                                      => fc_pd ,
  fc_ph                                      => fc_ph ,
  fc_sel                                     => fc_sel ,

  -------------------------------------------------------------------------------------------------------------------
  -- 4. Configuration (CFG) Interface                                                                              --
  -------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------
   -- EP and RP                                                      --
  ---------------------------------------------------------------------

  cfg_mgmt_do                                => open ,
  cfg_mgmt_rd_wr_done                        => open ,

  cfg_status                                 => cfg_status ,
  cfg_command                                => cfg_command ,
  cfg_dstatus                                => cfg_dstatus ,
  cfg_dcommand                               => cfg_dcommand ,
  cfg_lstatus                                => cfg_lstatus ,
  cfg_lcommand                               => cfg_lcommand ,
  cfg_dcommand2                              => cfg_dcommand2 ,
  cfg_pcie_link_state                        => cfg_pcie_link_state ,

  cfg_pmcsr_pme_en                           => open ,
  cfg_pmcsr_pme_status                       => open ,
  cfg_pmcsr_powerstate                       => open ,
  cfg_received_func_lvl_rst                  => open ,

  cfg_mgmt_di                                => cfg_mgmt_di ,
  cfg_mgmt_byte_en                           => cfg_mgmt_byte_en ,
  cfg_mgmt_dwaddr                            => cfg_mgmt_dwaddr ,
  cfg_mgmt_wr_en                             => cfg_mgmt_wr_en ,
  cfg_mgmt_rd_en                             => cfg_mgmt_rd_en ,
  cfg_mgmt_wr_readonly                       => cfg_mgmt_wr_readonly ,

  cfg_err_ecrc                               => cfg_err_ecrc ,
  cfg_err_ur                                 => cfg_err_ur ,
  cfg_err_cpl_timeout                        => cfg_err_cpl_timeout ,
  cfg_err_cpl_unexpect                       => cfg_err_cpl_unexpect ,
  cfg_err_cpl_abort                          => cfg_err_cpl_abort ,
  cfg_err_posted                             => cfg_err_posted ,
  cfg_err_cor                                => cfg_err_cor ,
  cfg_err_atomic_egress_blocked              => cfg_err_atomic_egress_blocked ,
  cfg_err_internal_cor                       => cfg_err_internal_cor ,
  cfg_err_malformed                          => cfg_err_malformed ,
  cfg_err_mc_blocked                         => cfg_err_mc_blocked ,
  cfg_err_poisoned                           => cfg_err_poisoned ,
  cfg_err_norecovery                         => cfg_err_norecovery ,
  cfg_err_tlp_cpl_header                     => cfg_err_tlp_cpl_header,
  cfg_err_cpl_rdy                            => cfg_err_cpl_rdy ,
  cfg_err_locked                             => cfg_err_locked ,
  cfg_err_acs                                => cfg_err_acs ,
  cfg_err_internal_uncor                     => cfg_err_internal_uncor ,

  cfg_trn_pending                            => cfg_trn_pending ,
  cfg_pm_halt_aspm_l0s                       => cfg_pm_halt_aspm_l0s ,
  cfg_pm_halt_aspm_l1                        => cfg_pm_halt_aspm_l1 ,
  cfg_pm_force_state_en                      => cfg_pm_force_state_en ,
  cfg_pm_force_state                         => cfg_pm_force_state ,

  ---------------------------------------------------------------------
   -- EP Only                                                        --
  ---------------------------------------------------------------------

  cfg_interrupt                              => cfg_interrupt ,
  cfg_interrupt_rdy                          => cfg_interrupt_rdy ,
  cfg_interrupt_assert                       => cfg_interrupt_assert ,
  cfg_interrupt_di                           => cfg_interrupt_di ,
  cfg_interrupt_do                           => cfg_interrupt_do ,
  cfg_interrupt_mmenable                     => cfg_interrupt_mmenable ,
  cfg_interrupt_msienable                    => cfg_interrupt_msienable ,
  cfg_interrupt_msixenable                   => cfg_interrupt_msixenable ,
  cfg_interrupt_msixfm                       => cfg_interrupt_msixfm ,
  cfg_interrupt_stat                         => cfg_interrupt_stat ,
  cfg_pciecap_interrupt_msgnum               => cfg_pciecap_interrupt_msgnum ,
  cfg_to_turnoff                             => cfg_to_turnoff ,
  cfg_turnoff_ok                             => cfg_turnoff_ok ,
  cfg_bus_number                             => cfg_bus_number ,
  cfg_device_number                          => cfg_device_number ,
  cfg_function_number                        => cfg_function_number ,
  cfg_pm_wake                                => cfg_pm_wake ,

  ---------------------------------------------------------------------
   -- RP Only                                                        --
  ---------------------------------------------------------------------
  cfg_pm_send_pme_to                         => '0' ,
  cfg_ds_bus_number                          => x"00" ,
  cfg_ds_device_number                       => "00000" ,
  cfg_ds_function_number                     => "000" ,
  cfg_mgmt_wr_rw1c_as_rw                     => '0' ,
  cfg_msg_received                           => open ,
  cfg_msg_data                               => open ,

  cfg_bridge_serr_en                         => open ,
  cfg_slot_control_electromech_il_ctl_pulse  => open ,
  cfg_root_control_syserr_corr_err_en        => open ,
  cfg_root_control_syserr_non_fatal_err_en   => open ,
  cfg_root_control_syserr_fatal_err_en       => open ,
  cfg_root_control_pme_int_en                => open ,
  cfg_aer_rooterr_corr_err_reporting_en      => open ,
  cfg_aer_rooterr_non_fatal_err_reporting_en => open ,
  cfg_aer_rooterr_fatal_err_reporting_en     => open ,
  cfg_aer_rooterr_corr_err_received          => open ,
  cfg_aer_rooterr_non_fatal_err_received     => open ,
  cfg_aer_rooterr_fatal_err_received         => open ,

  cfg_msg_received_err_cor                   => open ,
  cfg_msg_received_err_non_fatal             => open ,
  cfg_msg_received_err_fatal                 => open ,
  cfg_msg_received_pm_as_nak                 => open ,
  cfg_msg_received_pm_pme                    => open ,
  cfg_msg_received_pme_to_ack                => open ,
  cfg_msg_received_assert_int_a              => open ,
  cfg_msg_received_assert_int_b              => open ,
  cfg_msg_received_assert_int_c              => open ,
  cfg_msg_received_assert_int_d              => open ,
  cfg_msg_received_deassert_int_a            => open ,
  cfg_msg_received_deassert_int_b            => open ,
  cfg_msg_received_deassert_int_c            => open ,
  cfg_msg_received_deassert_int_d            => open ,

  -------------------------------------------------------------------------------------------------------------------
  -- 5. Physical Layer Control and Status (PL) Interface                                                           --
  -------------------------------------------------------------------------------------------------------------------
  pl_directed_link_auton                     => pl_directed_link_auton ,
  pl_directed_link_change                    => pl_directed_link_change ,
  pl_directed_link_speed                     => pl_directed_link_speed ,
  pl_directed_link_width                     => pl_directed_link_width ,
  pl_upstream_prefer_deemph                  => pl_upstream_prefer_deemph ,

  pl_sel_lnk_rate                            => pl_sel_lnk_rate ,
  pl_sel_lnk_width                           => pl_sel_lnk_width ,
  pl_ltssm_state                             => pl_ltssm_state ,
  pl_lane_reversal_mode                      => pl_lane_reversal_mode ,

  pl_phy_lnk_up                              => open ,
  pl_tx_pm_state                             => open ,
  pl_rx_pm_state                             => open ,

  cfg_dsn                                    => cfg_dsn ,

  pl_link_upcfg_cap                          => pl_link_upcfg_cap ,
  pl_link_gen2_cap                           => pl_link_gen2_cap ,
  pl_link_partner_gen2_supported             => pl_link_partner_gen2_supported ,
  pl_initial_link_width                      => pl_initial_link_width ,

  pl_directed_change_done                    => open ,

  ---------------------------------------------------------------------
   -- EP Only                                                        --
  ---------------------------------------------------------------------
  pl_received_hot_rst                        => pl_received_hot_rst ,

  ---------------------------------------------------------------------
   -- RP Only                                                        --
  ---------------------------------------------------------------------
  pl_transmit_hot_rst                        => '0' ,
  pl_downstream_deemph_source                => '0' ,

  -------------------------------------------------------------------------------------------------------------------
  -- 6. AER interface                                                                                              --
  -------------------------------------------------------------------------------------------------------------------
  cfg_err_aer_headerlog                      => cfg_err_aer_headerlog ,
  cfg_aer_interrupt_msgnum                   => cfg_aer_interrupt_msgnum ,
  cfg_err_aer_headerlog_set                  => cfg_err_aer_headerlog_set ,
  cfg_aer_ecrc_check_en                      => cfg_aer_ecrc_check_en ,
  cfg_aer_ecrc_gen_en                        => cfg_aer_ecrc_gen_en ,

  -------------------------------------------------------------------------------------------------------------------
  -- 7. VC interface                                                                                               --
  -------------------------------------------------------------------------------------------------------------------
  cfg_vc_tcvc_map                            => open ,


  -------------------------------------------------------------------------------------------------------------------
  -- 8. System(SYS) Interface                                                                                      --
  -------------------------------------------------------------------------------------------------------------------
  PIPE_MMCM_RST_N                            =>  PIPE_MMCM_RST_N,        -- Async      | Async
  sys_clk                                    => sys_clk ,
  sys_reset                                  => sys_reset_c
);

-- INST_TAG_END ------ End INSTANTIATION Template ---------
