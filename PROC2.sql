USE fidility_new
GO
/****** Object:  StoredProcedure [dbo].[AutoMapTables_Id_data]    Script Date: 11/27/2017 2:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AutoMapTables_Id_data]    
AS 
BEGIN
SET NOCOUNT ON;

--MERGING VALUES INTO GROUP , PRODUCT , LOCATION MASTERS, DIVISION ,FACILITY, VENDOR ,EMPLOYEE MASTERS
BEGIN

--MEGE GROUP MASTER	
MERGE group_master gp
USING ( select distinct [group] from temp_hardware_register_old where [group] !='NA' ) as  hd
ON hd.[group]= gp.group_name
WHEN NOT MATCHED THEN insert  (group_name,group_code) values (hd.[group],'-') ;

--MERGE UNIT MASTER
MERGE uom_master um
USING ( select distinct [uom] from temp_hardware_register_old  where [uom] !='NA') as  hd
ON hd.[uom]= um.unit_name
WHEN NOT MATCHED THEN insert  (unit_name,unit_code) values (hd.[uom],'-');

--MERGE LOCATION MASTER
MERGE location_master lt
USING ( select distinct [location] from temp_hardware_register_old where [location] !='NA') as  hd
ON hd.[location]= lt.loc_name
WHEN NOT MATCHED THEN insert  (loc_name,loc_code) values (hd.[location],'-');

--MERGE DIVISION MASTER
MERGE division_master dt
USING (select distinct [division],division_code from temp_hardware_register_old where division is not null AND  division !='NA') as  hd
ON hd.[division]= dt.div_name
WHEN NOT MATCHED THEN insert  (div_name,div_code) values (hd.[division],hd.division_code);

--MERGE COUNTRY MASTER
MERGE country_master ct
USING ( select distinct [country] from temp_hardware_register_old where country is not null AND country !='NA') as  hd
ON hd.[country]= ct.country_name
WHEN NOT MATCHED THEN  insert  (country_name,country_code)  values (hd.country,'-');

--MERGE VENDOR_MASTER
MERGE vendor_master vt
USING (select distinct vendor, vendor_add1,vendor_city,vendor_code,vendor_contact1,vendor_country,isnull (vendor_phone,0) vendor_phone,vendor_state from temp_hardware_register_old
       where vendor is not null AND vendor !='NA') as  hd
ON hd.[vendor]= vt.vendor_name
WHEN NOT MATCHED THEN  insert  (vendor_name, vendor_add1,vendor_city,vendor_code,vendor_contact1,vendor_country,vendor_phone,vendor_phone1,vendor_state, procured_vendor, service_vendor, insurance_vendor)
values (hd.vendor, hd.vendor_add1, hd.vendor_city, hd.vendor_code, hd.vendor_contact1,hd.vendor_country,hd.vendor_phone, '-',hd.vendor_state,0,0,0 ) ;

update vendor_master 
set procured_vendor=hd.p, insurance_vendor=hd.i, service_vendor=hd.s
from vendor_master vt
join(select distinct vendor,isnull( v1.vendor_id,'0') as p,isnull( v2.vendor_id,'0') as s,isnull( v3.vendor_id,'0') as i
	from temp_hardware_register_old h
	left join vendor_master v1
	on v1.vendor_name=h.procured_vendor
	left join  vendor_master v2
	on v2.vendor_name=h.service_vendor
	left join  vendor_master v3
	on v3.vendor_name=h.insurance_vendor
	where vendor is not null AND vendor !='NA') as hd
ON hd.vendor = vt.vendor_name
 
END

 --MERGING VALUES INTO SUB GROUP , SUB LOCATION ,  FACILITY, CUBICLE, WORKAREA ,COSTCENTER, DEPARTMENT,PRODUCT
BEGIN

--MERGE SUBGROUP MASTER
MERGE subgroup_master st
USING ( select distinct  group_master.group_id ,    subgroup, convert(char(10), t.asset_prefix) asset_prefix, convert(char(10), t.accessory_prefix) accessory_prefix, t.asset_type 
        from group_master
        join temp_hardware_register_old  t
        on group_name=t.[group] 
		where  subgroup !='NA') as  hd
ON hd.[subgroup]= st.subgroup_name
WHEN NOT MATCHED THEN  insert  (group_id,subgroup_name,subgroup_code ,asset_prefix,accessory_prefix,asset_type) values (hd.group_id, hd.[subgroup],'-',hd.asset_prefix,hd.accessory_prefix,hd.asset_type);

--MERGE PRODUCT MASTER
MERGE t_product_config pt
USING ( select  distinct iif  ( h.product_type ='asset' , 0 , 1 ) A,'1900-01-01' startDate, '1900-01-01' endDate, h.assetname,  h.assetdesc, t.group_id,  t.subgroup_id  
		from temp_hardware_register_old h
		join subgroup_master t
		on subgroup=t.subgroup_name) as  hd
ON hd.[assetname]= pt.product_name and  hd.assetdesc= convert(nvarchar(500),pt.[description])
WHEN NOT MATCHED THEN 
insert  (product_name,product_code,manufacture ,group_id,subgroup_id,model ,[description],asset_accessory,startDate ,endDate )
values (hd.[assetname], '-', '-', hd.group_id, hd.subgroup_id, '-', hd.assetdesc, hd.A ,hd.startDate,hd.endDate ) ;

--MERGE SUBLOCATION
MERGE sublocation_master lt
USING ( select distinct t.loc_id, hd.sub_location
		from temp_hardware_register_old hd
		join location_master t 
		on  hd.[location]= loc_name
		where  sub_location !='NA') as  hd
ON hd.[sub_location]= lt.subloc_name
WHEN NOT MATCHED THEN insert  (loc_id,subloc_name,subloc_code)values (hd.loc_id, hd.[sub_location],'-') ;

--MERGE BUILDING MASTER 	
MERGE facility_master ft
USING ( select distinct   t.facility,  lt.loc_id,st.subloc_id,ct.country_id
		from temp_hardware_register_old t
		join location_master lt
		on loc_name= t.[location]
		join sublocation_master st
		on subloc_name = t.sub_location
		join country_master ct
		on country_name=t.country
		where facility != 'NA' and facility is not null ) as  hd
ON hd.[facility]= ft.facility_name
WHEN NOT MATCHED THEN insert  (  address1,address2,facility_code,facility_name,loc_id,pin,subloc_id,country_id ) values ('-','-','-',   [facility],  hd.loc_id,'-' ,hd.subloc_id,hd.country_id)   ;

-- MERGE FLOOR MASTER
MERGE cubicle_master ct
USING (select distinct hd.cubicle ,t.facility_id,t.loc_id,t.subloc_id
		from facility_master t
		join temp_hardware_register_old hd
		on t.facility_name= hd.facility  
		where  cubicle is not null and cubicle != 'NA') as  hd
ON hd.[cubicle]= ct.cubicle_name
WHEN NOT MATCHED THEN insert  ( cubicle_bond,cubicle_code,cubicle_name,facility_id,loc_id,subloc_id,work_id,work_name )values ('-','-',hd.cubicle ,hd.facility_id,hd.loc_id,hd.subloc_id,0,'-');

--MERGE WORKAREA MASTER
MERGE workarea_master dt
USING ( select  distinct  t.cubicle_id,t.facility_id,t.loc_id,t.subloc_id,hd.workarea
		from cubicle_master t
		join temp_hardware_register_old hd
		on t.cubicle_name=  hd.cubicle
		where  workarea is not null  and workarea !='NA' ) as  hd
ON hd.[workarea]= dt.workarea_name
WHEN NOT MATCHED THEN   insert  ( cubicle_id,facility_id,loc_id,subloc_id,workarea_code,workarea_name ) values (hd.[cubicle_id],hd.facility_id,hd.loc_id,hd.subloc_id,'-',hd.workarea);

--MERGE COST CENTER MASTER
MERGE costcenter_master ct
USING (select distinct hd.costcenter_code,hd.costcenter,t.div_id 
		from division_master t
		join temp_hardware_register_old hd
		on t.div_name=hd.division
		where   costcenter is not null and costcenter != 'NA') as  hd
ON hd.[costcenter]= ct.costcenter_name
WHEN NOT MATCHED THEN   insert  (costcenter_code,costcenter_name,div_id,sl_id,comp_code ) values (hd.costcenter_code,hd.costcenter,hd.div_id ,1,1);

-- MERGE DEPARTMENT MASTER
MERGE department_master dt
USING ( select distinct hd.department,t.costcenter_id,t.div_id
		from  costcenter_master t
		join temp_hardware_register_old hd
		on t.costcenter_name= hd.costcenter
		where  department is not null and department !='NA') as  hd
ON hd.[department]= dt.dep_name
WHEN NOT MATCHED THEN  insert  ( dep_code,dep_name,[entity_id],costcenter_id,div_id ) values ('-',hd.department,0,hd.costcenter_id,hd.div_id);
 
 -- MERGE EMPLOYEE MASTER
	MERGE employee_master et
USING ( select distinct isnull( hd.Employee_contact_no,'0') as Employee_contact_no, t.costcenter_id,  t.div_id, hd.Employee_email_id, hd.Employee_code, hd.Employee_Name,  l.loc_id, sl.subloc_id
		from  costcenter_master t
		join temp_hardware_register_old hd
		on t.costcenter_name=hd.costcenter 
		join  sublocation_master  sl
		on  sl.subloc_name=hd.sub_location
		join  location_master l
		on  l.loc_name= hd.[location] 
		where employee_code is not null AND employee_code !='NA' ) as  hd
ON hd.[employee_code]= et.emp_code
WHEN NOT MATCHED THEN
insert  (contact_no,costcenter_id,date_of_resign,div_id,email_id,emp_code,emp_name,extension,loc_id,subloc_id,working_status  )
values ( hd.Employee_contact_no, hd.costcenter_id,'1900-01-01',hd.div_id,hd.Employee_email_id,hd.Employee_code,hd.Employee_Name,'-',hd.loc_id,hd.subloc_id,1) ;

--MERGE USER MANAGER
MERGE user_manager um
USING ( select emp_id, emp_name,email_id from employee_master) as  em
ON em.emp_id= um.emp_id
WHEN NOT MATCHED THEN insert  (emp_id,emp_name,login_name,[password],user_type,email_id,[status]) values (em.emp_id,em.emp_name,em.emp_name,'1234','employee',em.email_id,'1');

END

-- AUTO CODE GENERATION BASED ON ID 'S
 BEGIN
 
 update group_master set group_code=  'GRP-'+RIGHT('0000' + convert(varchar(4), group_id),3)
 update subgroup_master set subgroup_code= 'SGRP-'+RIGHT('0000' + convert(varchar(4), subgroup_id),3)
 update t_product_config set product_code= 'PDT-'+RIGHT('0000' + convert(varchar(4), product_id),3)
 update location_master set loc_code= 'CIT-'+ RIGHT('0000' + convert(varchar(4), loc_id),3)
 update sublocation_master set subloc_code= 'SIT-'+ RIGHT('0000' + convert(varchar(4), subloc_id),3)
 update facility_master set facility_code= 'BLD-'+ RIGHT('0000' + convert(varchar(4), facility_id),3)
 update cubicle_master set cubicle_code= 'FLR-'+ RIGHT('0000' + convert(varchar(4), cubicle_id),3)
 update workarea_master set workarea_code= 'WRK-'+  RIGHT('0000' + convert(varchar(4), workarea_id),3)
 update department_master set dep_code= 'DEPT-'+  RIGHT('0000' + convert(varchar(4), dep_id),3)
 update country_master set country_code= 'CNT-'+  RIGHT('0000' + convert(varchar(4), country_id),3)
 update uom_master set uom_code= 'UoM-'+  RIGHT('0000' + convert(varchar(4), unit_id),3)

END

-- MAPPING VALUES FROM   GROUP ,  LOCATION , FACILITY, CUBICLE, WORKAREA MASTERS TO   HARDWARE REGISTER
BEGIN

--MERGE HARDWARE REGISTER
MERGE hardware_register hd
USING ( select ISNULL (serialnumber,'-') AS serialnumber, ISNULL(po_number,'-') AS po_number, ISNULL(invoice_number,'-') AS invoice_number,convert (decimal(10,2),amount) as asset_cost,   
		IIF ( temp_hardware_register_old.product_type='asset',0,1) product_type, temp_hardware_register_old.asset_type, assetname,assetdesc,isnull (subgroup_id,0) as subgroup_id,
		isnull (group_id ,0)as group_id, isnull (sublocation_master.subloc_id,0) as subloc_id,
		isnull (location_master.loc_id ,0)as loc_id, isnull (vendor_master.procured_vendor,0) as procured_vendor, isnull (vendor_master.service_vendor, 0)as service_vendor,
		isnull (division_master.div_id,0)as bu_id, isnull (department_master.dep_id,0) dep_id, isnull (costcenter_master.costcenter_id,0) costcenter_id, isnull (emp_id,0) emp_id,
		isnull ( f.facility_id,0) facility_id,  isnull (c.cubicle_id,0) cubicle_id, isnull (w.workarea_id,0) workarea_id 
		from temp_hardware_register_old
		left join subgroup_master
		on subgroup_name=subgroup
		left join location_master
		on loc_name=[location]
		left join sublocation_master
		on subloc_name=sub_location
		left join vendor_master
		on vendor_name= vendor
		left join department_master
		on dep_name=department
		left join costcenter_master
		on costcenter=costcenter_name
		left join employee_master
		on Employee_Name=emp_name
		left join division_master 
		on div_name=division
		left join(select facility_id, facility_name , loc_name,subloc_name from facility_master
				join location_master
				on facility_master.loc_id= location_master.loc_id
				join sublocation_master
				on facility_master.subloc_id =sublocation_master.subloc_id)f
		on facility=f.facility_name and  temp_hardware_register_old.[location]=f.loc_name and sub_location=f.subloc_name
		left join(select cubicle_id, cubicle_name,  facility_name , loc_name,subloc_name from cubicle_master
				join   facility_master
				on facility_master.facility_id=cubicle_master.facility_id
				join location_master
				on facility_master.loc_id= location_master.loc_id
				join sublocation_master
				on      facility_master.subloc_id =sublocation_master.subloc_id )c
		on cubicle=c.cubicle_name and  facility=c.facility_name and  temp_hardware_register_old.[location]=c.loc_name and sub_location=c.subloc_name
		left join(select workarea_id, workarea_name, cubicle_name,  facility_name , loc_name,subloc_name from  workarea_master  
				join   cubicle_master
				on workarea_master.cubicle_id=cubicle_master.cubicle_id
				join   facility_master
				on facility_master.facility_id=cubicle_master.facility_id
				join location_master
				on facility_master.loc_id= location_master.loc_id
				join sublocation_master
				on      facility_master.subloc_id =sublocation_master.subloc_id )w
		on workarea=w.workarea_name and  cubicle=w.cubicle_name and  facility=w.facility_name and  temp_hardware_register_old.[location]=w.loc_name and sub_location=w.subloc_name )td 
ON 1=2
WHEN  NOT MATCHED THEN
INSERT(serialno, ponumber, invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
subgroup_id,procured_vendor_id,service_vendor_id,costcenter_id,bu_id,dep_id,assignedto,facility_id,cubicle_id,workarea_id  ) 
values( td.serialnumber,td.po_number,td.invoice_number, td.asset_cost,    td.product_type,td.asset_type,td.assetname,td.assetdesc,
td.loc_id,  td.subloc_id, td.group_id,td.subgroup_id,td.procured_vendor,td.service_vendor,td.costcenter_id,td.bu_id,td.dep_id,td.emp_id,td.facility_id,td.cubicle_id,td.workarea_id  )  ;

--GENEREATE ASSET-ID
UPDATE hardware_register
set assetid=   rtrim(t.asset_prefix) +'-'+ RIGHT('0000' + convert(varchar(4), t.slno),3)
from hardware_register hd
join(SELECT ast_id,asset_prefix, ROW_NUMBER() over ( partition by asset_prefix order by asset_prefix) as slno
	 FROM hardware_register h
	 join subgroup_master s
	 on h.subgroup_id=s.subgroup_id)t
on  hd.ast_id =t.ast_id

UPDATE hardware_register
set assetid=   'OTH-'+ RIGHT('0000' + convert(varchar(4), t.rno),3)
from hardware_register hd
join ( SELECT ast_id, ROW_NUMBER() over ( order by ast_id) as rno		FROM hardware_register h where assetid='')t
on  hd.ast_id =t.ast_id

END

TRUNCATE TABLE temp_hardware_register_old  

END



