USE [fidility_new]
GO
/****** Object:  Table [dbo].[facility_master]    Script Date: 11/28/2017 7:04:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facility_master](
	[facility_id] [int] IDENTITY(1,1) NOT NULL,
	[loc_id] [int] NOT NULL,
	[subloc_id] [int] NOT NULL,
	[facility_code] [varchar](50) NOT NULL,
	[facility_name] [varchar](100) NOT NULL,
	[address1] [varchar](300) NOT NULL,
	[address2] [varchar](300) NOT NULL,
	[pin] [int] NOT NULL,
	[country_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_master]    Script Date: 11/28/2017 7:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_master](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_code] [varchar](50) NOT NULL,
	[group_name] [varchar](100) NOT NULL,
	[group_desc] [varchar](max) NOT NULL,
	[treshold_date] [int] NOT NULL,
	[treshold_month] [varchar](10) NOT NULL,
	[rate_before] [varchar](10) NOT NULL,
	[rate_after] [varchar](10) NOT NULL,
	[lifeofasset] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hardware_register]    Script Date: 11/28/2017 7:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hardware_register](
	[ast_id] [int] IDENTITY(1,1) NOT NULL,
	[assetid] [varchar](100) NOT NULL,
	[assetname] [varchar](255) NOT NULL,
	[serialno] [varchar](500) NULL,
	[assetdesc] [varchar](300) NOT NULL,
	[group_id] [int] NOT NULL,
	[subgroup_id] [int] NOT NULL,
	[instl_date] [datetime] NOT NULL,
	[ponumber] [varchar](100) NOT NULL,
	[podate] [datetime] NOT NULL,
	[dcnumber] [varchar](100) NOT NULL,
	[dcdate] [datetime] NOT NULL,
	[invoicenumber] [varchar](100) NOT NULL,
	[invoicedate] [datetime] NOT NULL,
	[grn_number] [varchar](100) NOT NULL,
	[vouchernumber] [varchar](100) NOT NULL,
	[grndate] [datetime] NOT NULL,
	[voucherdate] [datetime] NOT NULL,
	[depreciate] [char](1) NOT NULL,
	[taggable] [char](1) NOT NULL,
	[manufacturer] [varchar](100) NOT NULL,
	[procured_vendor_id] [int] NOT NULL,
	[service_vendor_id] [int] NOT NULL,
	[amc_warranty] [varchar](20) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
	[assetqty] [int] NOT NULL,
	[asset_cost] [decimal](29, 2) NOT NULL,
	[additional_cost] [decimal](18, 2) NOT NULL,
	[assetvalue] [decimal](29, 2) NOT NULL,
	[assetbond] [varchar](100) NOT NULL,
	[leasestatus] [varchar](20) NOT NULL,
	[leasestartdate] [datetime] NOT NULL,
	[leaseenddate] [datetime] NOT NULL,
	[asset_config] [varchar](250) NOT NULL,
	[model_no] [varchar](100) NOT NULL,
	[loc_id] [int] NOT NULL,
	[subloc_id] [int] NOT NULL,
	[facility_id] [int] NOT NULL,
	[cubicle_id] [int] NOT NULL,
	[assignedby] [int] NOT NULL,
	[assignedto] [int] NOT NULL,
	[costcenter_id] [int] NULL,
	[sold] [varchar](50) NOT NULL,
	[sold_date] [datetime] NOT NULL,
	[soldrem] [varchar](200) NOT NULL,
	[currencyid] [int] NOT NULL,
	[exchange_rate_invoice] [decimal](29, 2) NOT NULL,
	[stp_ct3_no] [varchar](100) NOT NULL,
	[bond_no] [varchar](100) NOT NULL,
	[type_of_import] [varchar](100) NOT NULL,
	[installed] [int] NOT NULL,
	[asset_type] [varchar](50) NOT NULL,
	[asset_remarks] [varchar](250) NOT NULL,
	[soft_key] [varchar](100) NOT NULL,
	[soft_assetid] [varchar](100) NOT NULL,
	[asset_accessory] [varchar](100) NOT NULL,
	[repair_status] [int] NOT NULL,
	[Return_date] [datetime] NOT NULL,
	[bond_date] [datetime] NOT NULL,
	[ct3_date] [datetime] NOT NULL,
	[stpi_appl_no] [varchar](100) NOT NULL,
	[stpi_appr_no] [varchar](100) NOT NULL,
	[stpi_appr_date] [datetime] NOT NULL,
	[stpi_appr_value] [decimal](29, 2) NOT NULL,
	[billof_entry_no] [varchar](100) NULL,
	[billof_entry_date] [datetime] NOT NULL,
	[billof_entry_value] [decimal](29, 2) NOT NULL,
	[invoice_amount] [decimal](29, 2) NOT NULL,
	[fob_cif] [varchar](50) NOT NULL,
	[hss_load_rate] [decimal](29, 2) NOT NULL,
	[freight_rate] [decimal](29, 2) NOT NULL,
	[insurance_charge] [decimal](29, 2) NOT NULL,
	[fob_cif_value] [decimal](29, 2) NOT NULL,
	[assessible_value] [decimal](29, 2) NOT NULL,
	[tariff_id] [int] NOT NULL,
	[bcd] [decimal](29, 2) NOT NULL,
	[cvd] [decimal](29, 2) NOT NULL,
	[cess] [decimal](29, 2) NOT NULL,
	[ecess] [decimal](29, 2) NOT NULL,
	[cecess] [decimal](29, 2) NOT NULL,
	[total_duty_forgone] [decimal](29, 2) NOT NULL,
	[shipment] [varchar](50) NOT NULL,
	[cg_balance] [decimal](29, 2) NOT NULL,
	[cg_utilized] [decimal](29, 2) NOT NULL,
	[softlife] [int] NOT NULL,
	[softlife_stdate] [datetime] NOT NULL,
	[softlife_enddate] [datetime] NOT NULL,
	[dep_date] [datetime] NOT NULL,
	[dep_id] [int] NOT NULL,
	[debond_status] [int] NOT NULL,
	[accept_reject] [int] NOT NULL,
	[transfer_status] [varchar](100) NOT NULL,
	[deprate] [decimal](18, 0) NOT NULL,
	[insurance] [varchar](50) NOT NULL,
	[insurance_vender] [varchar](50) NOT NULL,
	[policy_no] [varchar](50) NOT NULL,
	[insurance_startdate] [datetime] NOT NULL,
	[insurance_enddate] [datetime] NOT NULL,
	[Transfer_Asset] [int] NOT NULL,
	[parent_id] [varchar](50) NOT NULL,
	[mac] [varchar](50) NOT NULL,
	[year_manufac] [varchar](50) NOT NULL,
	[part_no] [varchar](50) NOT NULL,
	[customer] [int] NOT NULL,
	[host_name] [varchar](50) NOT NULL,
	[ip_address] [varchar](50) NOT NULL,
	[return_date1] [datetime] NOT NULL,
	[intended_user] [varchar](max) NULL,
	[workarea_id] [int] NOT NULL,
	[tag_id] [varchar](20) NOT NULL,
	[unit_id] [int] NOT NULL,
	[bond_reg_id] [int] NOT NULL,
	[file_upload] [varchar](100) NOT NULL,
	[bu_id] [int] NOT NULL,
	[license_type] [varchar](100) NOT NULL,
	[usage_license_type] [varchar](100) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[Lease_calcul] [varchar](50) NOT NULL,
	[lifeof_asset] [int] NOT NULL,
	[lifeof_assets] [int] NOT NULL,
	[tax1] [int] NOT NULL,
	[tax2] [int] NOT NULL,
	[tax1_value] [decimal](18, 2) NOT NULL,
	[tax2_value] [decimal](18, 2) NOT NULL,
	[duty_paid] [int] NOT NULL,
	[duty] [decimal](18, 2) NOT NULL,
	[amc_cost] [decimal](18, 2) NOT NULL,
	[user_costcenter] [int] NOT NULL,
	[a_month] [int] NOT NULL,
	[a_date] [datetime] NOT NULL,
	[asset_number] [int] NOT NULL,
	[self_emp] [int] NOT NULL,
	[self_status] [int] NOT NULL,
	[s_date] [datetime] NOT NULL,
	[e_date] [datetime] NOT NULL,
	[asset_status] [int] NOT NULL,
	[mac_code] [varchar](100) NOT NULL,
	[allcate_type] [varchar](20) NOT NULL,
	[app_status] [varchar](50) NOT NULL,
	[are1_no] [varchar](50) NOT NULL,
	[are1_date] [datetime] NOT NULL,
	[test_machine] [int] NOT NULL,
	[capital] [varchar](20) NOT NULL,
	[remarks] [varchar](1000) NOT NULL,
	[waybill] [varchar](max) NOT NULL,
	[waybill_date] [datetime] NOT NULL,
	[asset_tag] [varchar](100) NOT NULL,
	[po] [varchar](100) NOT NULL,
	[purchase_price] [decimal](18, 2) NOT NULL,
	[purchase_dept] [varchar](100) NOT NULL,
	[purchase_date] [date] NOT NULL,
	[currency_amt] [decimal](18, 2) NOT NULL,
	[purchase_TXtrack] [varchar](100) NOT NULL,
	[awb] [varchar](100) NOT NULL,
	[assets_tag] [varchar](100) NOT NULL,
	[issued_to] [varchar](100) NOT NULL,
	[issued_dept_to] [varchar](100) NOT NULL,
	[key_contact] [varchar](100) NOT NULL,
	[key_dept] [varchar](100) NOT NULL,
	[asset_tech_team] [varchar](100) NOT NULL,
	[port_folio_id] [varchar](100) NOT NULL,
	[loaned_to] [varchar](100) NOT NULL,
	[loaned_dept] [varchar](100) NOT NULL,
	[loaned_end_date] [date] NOT NULL,
	[calibration_cost] [decimal](18, 2) NOT NULL,
	[make] [varchar](100) NOT NULL,
	[calibration] [varchar](100) NOT NULL,
	[calibration_date] [date] NOT NULL,
	[calibration_due_date] [date] NOT NULL,
	[calibration_interval] [varchar](100) NOT NULL,
	[attachments] [varchar](5000) NOT NULL,
	[mcn] [varchar](200) NOT NULL,
	[mcn_rev] [varchar](200) NOT NULL,
	[chip_type] [varchar](200) NOT NULL,
	[chip_rev] [varchar](200) NOT NULL,
	[imei] [varchar](200) NOT NULL,
	[built_by] [varchar](200) NOT NULL,
	[shipped_by] [varchar](200) NOT NULL,
	[asset_value] [decimal](18, 2) NOT NULL,
	[amc] [varchar](100) NOT NULL,
	[amc_interval] [varchar](100) NOT NULL,
	[amc_date] [date] NOT NULL,
	[amc_due_date] [date] NOT NULL,
	[asset_sub_group] [varchar](100) NULL,
	[installation_option] [varchar](max) NOT NULL,
	[subsubgroup_name] [varchar](50) NOT NULL,
	[adddate] [date] NOT NULL,
	[component_off] [varchar](100) NOT NULL,
	[debond] [varchar](50) NOT NULL,
	[serv_vendor] [varchar](max) NOT NULL,
	[subgroupp] [varchar](max) NOT NULL,
	[grn_id] [int] NOT NULL,
	[uom_id] [int] NOT NULL,
	[receive_date] [datetime] NOT NULL,
	[modelno] [varchar](max) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[loaned_date] [datetime] NOT NULL,
	[jtag] [varchar](max) NOT NULL,
	[licvalidity] [datetime] NOT NULL,
	[licensekey1] [varchar](max) NOT NULL,
	[licensekey2] [varchar](max) NOT NULL,
	[modeldesc] [varchar](max) NOT NULL,
	[stockroom] [varchar](max) NOT NULL,
	[purtype] [varchar](max) NOT NULL,
	[tracking] [varchar](max) NOT NULL,
	[supplier] [varchar](max) NOT NULL,
	[warrantyper] [varchar](max) NOT NULL,
	[chargetodept] [varchar](max) NOT NULL,
	[retired_date] [datetime] NOT NULL,
	[dispomethod] [varchar](max) NOT NULL,
	[warranty] [varchar](max) NOT NULL,
	[warrantyexpire] [varchar](max) NOT NULL,
	[pmstatus] [varchar](max) NOT NULL,
	[vendorcert] [varchar](max) NOT NULL,
	[caliserpro] [varchar](max) NOT NULL,
	[calibroutcome] [varchar](max) NOT NULL,
	[comment] [varchar](max) NOT NULL,
	[lastmodifiedby] [varchar](max) NOT NULL,
	[add_to_store_date] [datetime] NOT NULL,
	[assignment] [varchar](max) NOT NULL,
	[inboundtype] [varchar](max) NOT NULL,
	[iutfrom] [varchar](max) NOT NULL,
	[location] [varchar](max) NOT NULL,
	[serial_secondary] [varchar](max) NOT NULL,
	[asset_type1] [varchar](50) NOT NULL,
	[grn_done_by] [varchar](max) NOT NULL,
	[dep_tag] [varchar](max) NOT NULL,
	[ceanumber] [varchar](max) NOT NULL,
	[purchasetype] [varchar](max) NOT NULL,
	[taxcredit] [varchar](max) NOT NULL,
	[tds] [decimal](18, 2) NOT NULL,
	[gst] [decimal](18, 2) NOT NULL,
	[st] [decimal](18, 2) NOT NULL,
	[install_type] [varchar](max) NOT NULL,
	[install_status] [varchar](max) NOT NULL,
	[dep_status] [int] NOT NULL,
	[physical_id] [varchar](50) NOT NULL,
	[asset_wdv] [decimal](18, 2) NOT NULL,
	[acc_for_feb] [decimal](18, 2) NOT NULL,
	[additional_details1] [varchar](max) NOT NULL,
	[additional_details2] [varchar](max) NOT NULL,
	[voucher] [varchar](max) NOT NULL,
	[voucher_date] [datetime] NOT NULL,
	[sbc] [decimal](18, 2) NOT NULL,
	[kbc] [decimal](18, 2) NOT NULL,
	[inward_date] [datetime] NOT NULL,
	[sale_value] [decimal](18, 2) NOT NULL,
	[mac_id] [varchar](500) NOT NULL,
	[stpi_approval_no] [varchar](500) NOT NULL,
	[l2_approval] [varchar](500) NOT NULL,
	[hod_approval] [varchar](500) NOT NULL,
	[assembly_id] [varchar](max) NOT NULL,
	[assembly_type] [varchar](max) NOT NULL,
	[disable_status] [varchar](100) NOT NULL,
	[rack_id] [varchar](100) NOT NULL,
	[u_name] [varchar](100) NOT NULL,
	[accessory_ast_id] [varchar](100) NOT NULL,
	[file_type] [varchar](100) NOT NULL,
	[cr_req_status] [varchar](max) NOT NULL,
	[batch_id] [int] NOT NULL,
	[quality_check] [varchar](10) NOT NULL,
	[sap_id] [varchar](5000) NOT NULL,
	[rcnumber] [varchar](500) NOT NULL,
	[project_id] [varchar](10) NOT NULL,
	[tagstatus] [int] NOT NULL,
	[tagCount] [varchar](500) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subgroup_master]    Script Date: 11/28/2017 7:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subgroup_master](
	[subgroup_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[subgroup_code] [varchar](100) NOT NULL,
	[subgroup_name] [varchar](100) NOT NULL,
	[asset_prefix] [varchar](50) NOT NULL,
	[accessory_prefix] [varchar](50) NOT NULL,
	[computers] [varchar](100) NOT NULL,
	[asset_type] [varchar](10) NOT NULL,
	[life] [int] NOT NULL,
	[tangible] [int] NOT NULL,
	[all_type] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sublocation_master]    Script Date: 11/28/2017 7:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sublocation_master](
	[subloc_id] [int] IDENTITY(1,1) NOT NULL,
	[entity_id] [int] NOT NULL,
	[loc_id] [int] NOT NULL,
	[subloc_code] [varchar](50) NOT NULL,
	[subloc_name] [varchar](300) NOT NULL,
	[address1] [varchar](200) NOT NULL,
	[address2] [varchar](200) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[country] [varchar](100) NOT NULL,
	[pin] [varchar](20) NOT NULL,
	[emploccode] [varchar](50) NOT NULL,
	[subloc_name_bak] [varchar](50) NOT NULL,
	[unit_type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_sublocation_master] PRIMARY KEY CLUSTERED 
(
	[subloc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_product_config]    Script Date: 11/28/2017 7:04:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_product_config](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NULL,
	[product_code] [varchar](10) NOT NULL,
	[manufacture] [varchar](100) NULL,
	[group_id] [int] NULL,
	[subgroup_id] [int] NULL,
	[model] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[asset_accessory] [int] NULL,
	[partno] [varchar](50) NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[prod_img] [varchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('-') FOR [group_desc]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('0') FOR [treshold_date]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('-') FOR [treshold_month]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('0') FOR [rate_before]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('0') FOR [rate_after]
GO
ALTER TABLE [dbo].[group_master] ADD  DEFAULT ('0') FOR [lifeofasset]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [assetid]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [assetname]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [serialno]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [assetdesc]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [group_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [subgroup_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [instl_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [ponumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [podate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [dcnumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [dcdate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [invoicenumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [invoicedate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [grn_number]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [vouchernumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [grndate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [voucherdate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [depreciate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [taggable]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [manufacturer]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [procured_vendor_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [service_vendor_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [amc_warranty]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [expiry_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [assetqty]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [asset_cost]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [additional_cost]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [assetvalue]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [assetbond]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [leasestatus]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [leasestartdate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [leaseenddate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [asset_config]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [model_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [loc_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [subloc_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [facility_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [cubicle_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [assignedby]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [assignedto]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [sold]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [sold_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [soldrem]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [currencyid]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [exchange_rate_invoice]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [stp_ct3_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [bond_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [type_of_import]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [installed]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [asset_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [asset_remarks]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [soft_key]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [soft_assetid]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [asset_accessory]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [repair_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [Return_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [bond_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [ct3_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [stpi_appl_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [stpi_appr_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [stpi_appr_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [stpi_appr_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [billof_entry_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [billof_entry_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [billof_entry_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [invoice_amount]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [fob_cif]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [hss_load_rate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [freight_rate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [insurance_charge]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [fob_cif_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [assessible_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [tariff_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [bcd]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [cvd]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [cess]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [ecess]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [cecess]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [total_duty_forgone]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [shipment]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [cg_balance]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [cg_utilized]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [softlife]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [softlife_stdate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [softlife_enddate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [dep_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [dep_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [debond_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((1)) FOR [accept_reject]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [transfer_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [deprate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [insurance]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [insurance_vender]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [policy_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [insurance_startdate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [insurance_enddate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [Transfer_Asset]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [parent_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [mac]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [year_manufac]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [part_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [customer]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [host_name]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [ip_address]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [return_date1]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [intended_user]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [workarea_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [tag_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [unit_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [bond_reg_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [file_upload]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [bu_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [license_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [usage_license_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [start_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [end_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [Lease_calcul]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [lifeof_asset]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [lifeof_assets]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [tax1]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [tax2]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [tax1_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [tax2_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [duty_paid]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [duty]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [amc_cost]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [user_costcenter]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [a_month]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [a_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [asset_number]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [self_emp]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [self_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_s_date]  DEFAULT ('1900-01-01') FOR [s_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_e_date]  DEFAULT ('1900-01-01') FOR [e_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_asset_status]  DEFAULT ((0)) FOR [asset_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [mac_code]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [allcate_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [app_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_are1_no]  DEFAULT ('-') FOR [are1_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_are1_date]  DEFAULT (((1900)-(1))-(1)) FOR [are1_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [test_machine]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [capital]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [remarks]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [waybill]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [waybill_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [asset_tag]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [po]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [purchase_price]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [purchase_dept]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [purchase_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [currency_amt]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [purchase_TXtrack]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [awb]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [assets_tag]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [issued_to]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [issued_dept_to]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [key_contact]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [key_dept]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [asset_tech_team]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [port_folio_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [loaned_to]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [loaned_dept]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [loaned_end_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [calibration_cost]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [make]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [calibration]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [calibration_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [calibration_due_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [calibration_interval]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [attachments]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [mcn]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [mcn_rev]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [chip_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [chip_rev]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [imei]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [built_by]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [shipped_by]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [asset_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [amc]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [amc_interval]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [amc_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [amc_due_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [asset_sub_group]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [installation_option]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_subsubgroup_name]  DEFAULT ('-') FOR [subsubgroup_name]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_adddate]  DEFAULT ('1900-01-01') FOR [adddate]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_component_off]  DEFAULT ('-') FOR [component_off]
GO
ALTER TABLE [dbo].[hardware_register] ADD  CONSTRAINT [DF_hardware_register_debond]  DEFAULT ('-') FOR [debond]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [serv_vendor]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [subgroupp]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [grn_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [uom_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [receive_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [modelno]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [created_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [updated_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [loaned_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [jtag]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [licvalidity]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [licensekey1]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [licensekey2]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [modeldesc]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [stockroom]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [purtype]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [tracking]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [supplier]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [warrantyper]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [chargetodept]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [retired_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [dispomethod]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [warranty]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [warrantyexpire]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [pmstatus]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [vendorcert]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [caliserpro]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [calibroutcome]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [comment]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [lastmodifiedby]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [add_to_store_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [assignment]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [inboundtype]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [iutfrom]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [location]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [serial_secondary]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [asset_type1]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [grn_done_by]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [dep_tag]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [ceanumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [purchasetype]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [taxcredit]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [tds]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [gst]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [st]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [install_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [install_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [dep_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [physical_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [asset_wdv]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [acc_for_feb]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [additional_details1]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [additional_details2]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [voucher]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [voucher_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [sbc]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [kbc]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('1900-01-01') FOR [inward_date]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0.00') FOR [sale_value]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [mac_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [stpi_approval_no]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [l2_approval]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [hod_approval]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [assembly_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [assembly_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [disable_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [rack_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [u_name]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [accessory_ast_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [file_type]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [cr_req_status]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [batch_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [quality_check]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('') FOR [sap_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [rcnumber]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('-') FOR [project_id]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ((0)) FOR [tagstatus]
GO
ALTER TABLE [dbo].[hardware_register] ADD  DEFAULT ('0') FOR [tagCount]
GO
ALTER TABLE [dbo].[subgroup_master] ADD  CONSTRAINT [DF_subgroup_master_computers]  DEFAULT ('-') FOR [computers]
GO
ALTER TABLE [dbo].[subgroup_master] ADD  DEFAULT ('0') FOR [life]
GO
ALTER TABLE [dbo].[subgroup_master] ADD  DEFAULT ('0') FOR [tangible]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_entity_id]  DEFAULT ((0)) FOR [entity_id]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_address1]  DEFAULT ('') FOR [address1]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_address2]  DEFAULT ('') FOR [address2]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_city]  DEFAULT ('') FOR [city]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_Status]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_country]  DEFAULT ('') FOR [country]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_pin]  DEFAULT ('') FOR [pin]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  CONSTRAINT [DF_sublocation_master_emploccode]  DEFAULT ('-') FOR [emploccode]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  DEFAULT ('-') FOR [subloc_name_bak]
GO
ALTER TABLE [dbo].[sublocation_master] ADD  DEFAULT ('-') FOR [unit_type]
GO
ALTER TABLE [dbo].[t_product_config] ADD  DEFAULT ('-') FOR [prod_img]
GO
