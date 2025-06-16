<table cellspacing="0" cellpadding="0" border="0" width="100%">
    <tbody>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td bgcolor="#fff" style="padding: 0px; margin: 0px;">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tbody>
                                        <tr>
                                            <td align="center" style="padding: 0px; margin: 0px;">
                                                <table cellspacing="0" cellpadding="0" border="0" width="100%" style="border-bottom: 3px solid #5D87FF;">
                                                    <tbody>
                                                        <tr>
                                                            <td width="50%" align="left">
                                                            	<img width="100px" height="60px" src="{$employee_data['company_logo']}" alt="" />
                                                            </td>
                                                             <td width="50%" align="right">
                                                             	<font color="#222222" face="Arial, Helvetica, sans-serif">
                                                                    <span style="color: #796f6f; font-size: 16px; padding: 0px; position: relative; display: inline-block; font-weight: normal;margin-bottom: 10px;    font-weight: 500;">Payslip For the Month</span>                                                                     
                                                                </font>
                                                                <br />
                                                                 <font color="#222222" face="Arial, Helvetica, sans-serif">
                                                                    <span style="color: #222; font-size: 16px; padding: 0px; position: relative; display: inline-block;"><strong>{{$month}} {{$year}}</strong></span>
                                                                </font>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="100%" align="center" height="1"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="left" bgcolor="#fff" >
                    <tbody>
                    	<tr>
                            <td height="30" align="left" valign="top" >
                            	<font color="#9a8f8f" face="Arial, Helvetica, sans-serif" style="font-size: 15px;    margin-left: 30px;margin-bottom: 20px;"><strong style="color: #5D87FF;">&nbsp;&nbsp;	Employee Summary</strong></font>
							</td>
							
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="left" bgcolor="#fff" style="    border-bottom:2px dashed #7898f5;	">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td height="155" valign="top">
                                                                <table cellspacing="0" cellpadding="1" border="0" width="100%">
                                                                    <tbody>
                                                                    	
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Emploayee Name  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['full_name']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Company Name  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['company_name']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Department  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['departmen_name']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Date of Joining  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['employment_date']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>PF  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{display_no_character($employee_data['pf_number'])}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>A/C No.  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['account_no']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>

                                            <td>
                                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td height="155" valign="top">
                                                                <table cellspacing="0" cellpadding="1" border="0" width="100%">
                                                                    <tbody>
                                                                    	
                                                                    	<tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Employee Code  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['employee_code']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Location  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top"width="62%" >
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['address']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Designation  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['designation_name']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Pay Period  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$month}} {{$year}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>UAN  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{display_no_character()}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="20" align="left" valign="top" width="38%">
                                                                                <font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;"><strong>Mode of Pay  :</strong></font>
                                                                            </td>
                                                                            <td height="20" align="left" valign="top" width="62%">
                                                                            	<font color="#222222" face="Arial, Helvetica, sans-serif" style="font-size: 13px;font-weight: 400;">{{$employee_data['bank_name']}}</font>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
				            <td>&nbsp;</td>
				        </tr>

                        <tr>
                            <td align="left" style="max-height: 350px;">
                                <table class="default_table" cellspacing="0" cellpadding="10" border="0" width="100%" align="left" style="border-collapse: collapse;">
                                   
                                    <thead >
                                        
                                        <tr >
                                            
                                            <th width="33.33%"  height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Working Days : </strong>{$working_days}</font>
                                            </th>
                                            <th width="33.33%" height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Public Holiday : </strong>{$holidays} Days</font>
                                            </th>
                                            <th width="33.33%"  height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;    margin-left: 114px;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Week Off : </strong>{$week_off} Days</font>
                                            </th>
                                            
                                        </tr>
                                        <tr style="border: 1px solid #d6d3d3;">
                                            <th width="33.33%"  height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;    margin-left: 114px;border-top-left-radius: 10px;border-top-right-radius: 10px;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Leaves : </strong>{$leaves}</font>
                                            </th>
                                            
                                            <th width="33.33%"  height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Present Days : </strong>{$present_days} </font>
                                            </th>
                                            <th width="33.33%" height="20" valign="middle" align="center" style="text-align: center; border: 1px solid #d6d3d3;">
                                                <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Absent Days : </strong>{$absent_days} </font>
                                            </th>
                                            
                                        </tr>
                                    </thead>
                                </table>
                            </td>
                        </tr>
                       
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" >
                    <tbody>
                        <tr>
                           <td></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td bgcolor="#fff" >
                                 <table cellspacing="5" cellpadding="0" border="0" width="100%"  style="border: 1px solid #5D87FF;">
                                    <tbody>
                                        <tr>
                                            <td>
                                             <table class="default_table" cellspacing="0" cellpadding="10" border="0" width="100%"  >
                                                <thead >
                                                    <tr >

                                                        <th width="40%" height="20" valign="middle" align="left" style="text-align: left;border-bottom: 1px dashed #becfff">
                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>EARNINGS</strong></font>
                                                        </th>
                                                        <th width="30%" height="20" valign="middle" align="right" style="text-align: right; border-bottom: 1px dashed #becfff;">
                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>AMOUNT</strong></font>
                                                        </th>
                                                        <th width="30%" height="20" valign="middle" align="right" style="text-align: right; border-bottom: 1px dashed #becfff;">
                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>YTD</strong></font>
                                                        </th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach $income_arr as $key => $val}
                                                   
                                                        <tr>
                                                            <td width="40%" height="30" valign="middle" align="left" style="text-align: left;">
                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                    {$val.component_name}
                                                                </font>
                                                            </td>

                                                            <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                    <img src="">{number_format($val.component_value, 2)}
                                                                </font>
                                                            </td>

                                                            <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                    --
                                                                </font>
                                                            </td>
                                                        </tr>
                                                 
                                                {/foreach}
                                                
                                                </tbody>
                                            </table>
                                            </td>
                                            <td>
                                            
                                              <table class="default_table" cellspacing="0" cellpadding="10" border="0" width="98%"  >
                                                <thead >
                                                                    <tr >
                                                                        <th width="40%" height="20" valign="middle" align="left" style="text-align: left;border-bottom: 1px dashed #becfff;">
                                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>Deduiation </strong></font>
                                                                        </th>
                                                                        <th width="30%" height="20" valign="middle" align="right" style="text-align: right; border-bottom: 1px dashed #becfff;">
                                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>AMOUNT</strong></font>
                                                                        </th>
                                                                        <th width="30%" height="20" valign="middle" align="right" style="text-align: right; border-bottom: 1px dashed #becfff;">
                                                                            <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#5D87FF"><strong>YTD</strong></font>
                                                                        </th>
                                                                        
                                                                    </tr>
                                                                </thead>
                                                <tbody>
                                                    {foreach $deduction_arr as $key => $val}
                                                                           <tr>
                                                                            <td width="40%" height="30" valign="middle" align="left" style="text-align: left;">
                                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                                    {$val.component_name}
                                                                                </font>
                                                                            </td>
                                                                
                                                                            <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
                                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                                    {number_format($val.component_value, 2)}
                                                                                </font>
                                                                            </td>
                                                                
                                                                            <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
                                                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
                                                                                    --
                                                                                </font>
                                                                            </td>
                                                                        </tr>
                                                                  
                                                                {/foreach}
                                                           
                                                </tbody>
                                            </table>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                        		<table class="default_table" cellspacing="0" cellpadding="5" border="0" width="100%"  >
                                        			<tbody>
                                        				 <tr bgcolor="#f5f5fa">
		                                                    <td width="40%" height="30" valign="middle" align="left" style="text-align: left;">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                            <strong>Gross Earnings</strong>
		                                                         </font>
		                                                    </td>

		                                                    <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                            <strong>{number_format($total_income,2)}</strong>
		                                                        </font>
		                                                    </td>

		                                                    <td width="30%" height="30" valign="middle" align="right" style="text-align: right; ">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                           
		                                                        </font>
		                                                    </td>
		                                                </tr>
                                        			</tbody>
                                        		</table>
                                        	</td>
                                        	<td>
                                        		<table class="default_table" cellspacing="0" cellpadding="5" border="0" width="98%"  >
                                        			<tbody>
                                        				 <tr bgcolor="#f5f5fa">
		                                                    <td width="40%" height="30" valign="middle" align="left" style="text-align: left;">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                            <strong>Total Deductions</strong>
		                                                         </font>
		                                                    </td>

		                                                    <td width="30%" height="30" valign="middle" align="right" style="text-align: right;">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                            <strong>{number_format($total_deduction,2)}</strong>
		                                                        </font>
		                                                    </td>

		                                                    <td width="30%" height="30" valign="middle" align="right" style="text-align: right; ">
		                                                        <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#222222">
		                                                           
		                                                        </font>
		                                                    </td>
		                                                </tr>
                                        			</tbody>
                                        		</table>
                                        	</td>	
                                        </tr>


                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                                            <td align="center" height="10">
                                                
                                            </td>
                                        </tr>
                        <tr>
                            <td bgcolor="#fff" >
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="border: 1px solid #5D87FF; border-radius: 10% ;">
                                    <tbody>
                                    	
                                        <tr>
                                            <td align="center" style="padding: 0px; margin: 0px;">
                                                <table cellspacing="0" cellpadding="0" border="0" width="100%"  >
                                                    <tbody>
                                                        <tr>
                                                            <td width="70%">
                                                                <table class="default_table" cellspacing="3" cellpadding="5" border="0"   >
                                                                <thead >
                                                                    <tr >
                                                                        <th  valign="middle" align="left" style="text-align: left;" bgcolor="#fff" >

                                                                            <font style="font-size: 14px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>TOTAL NET PAYABLE </strong>
                                                                            </font>
                                                                            <br>
                                                                            <font style="font-size: 10px;" face="Arial, Helvetica, sans-serif" color="#999"><strong>Gross Earnings - Total Deduations</strong>
                                                                            </font>
                                                                        </th>                                                                        
                                                                    </tr>
                                                                </thead>	
                                                            	</table>
                                                            </td>
                                                            <td width="30%">
                                                            	<table class="default_table" cellspacing="1" cellpadding="0" border="0"   >
                                                                <thead >
                                                                    <tr bgcolor="#f7f4f0" >
                                                                        <th   valign="middle" align="center" style="text-align: center;padding-top: 15px;vertical-align: middle;" height="20">
                                                                            <font style="font-size: 15px;" face="Arial, Helvetica, sans-serif" color="#222222">
	                                                                            	<strong>
	                                                                            		<br>
	                                                                            	  {$total_net_amount}
	                                                                            	  <br>
	                                                                            </strong>
	                                                                        </font>
                                                                        </th>
                                                                        
                                                                    </tr>
                                                                </thead>	
                                                            	</table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                 <table cellspacing="0" cellpadding="5" border="0" width="100%" align="center" >
                                    <tbody>
                                        <tr>
                                            <td align="right">
                                                <font style="font-size: 13px;font-weight: 900;" face="Arial, Helvetica, sans-serif" color="#999" >Amount In Words : <strong style="font-weight: 900;font-size: 12px;color: #2A3547">{{$total_net_amount_in_word}}.</strong>
                                                </font>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td bgcolor="#fff" >
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="border-top: 2px solid #5D87FF;">
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr >
                            <td>
                                 <table cellspacing="0" cellpadding="5" border="0" width="100%" align="center" >
                                    <tbody>
                                        <tr>
                                            <td align="center" width="100%">
                                                <font style="font-size: 12px;" face="Arial, Helvetica, sans-serif" color="#999">-- This document has been automatically generated by {{strtolower($employee_data['company_name'])}}; therefore, a signature is not required. --</font>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="display: none;">
                            <td>
                                 <table cellspacing="0" cellpadding="5" border="0" width="100%" align="center" >
                                    <tbody>
                                        <tr>
                                            <td align="left" width="48%">
                                                <font style="font-size: 14px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Generated By:&nbsp;</strong></font>
                                                <font style="font-size: 13px;" face="Arial, Helvetica, sans-serif" color="#222222">Akash Chopda</font>
                                            </td>
                                            <td align="left" width="48%">
                                                <font style="font-size: 14px;" face="Arial, Helvetica, sans-serif" color="#222222"><strong>Signature:&nbsp;</strong></font>
                                                <font style="font-size: 15px; display: inline-block;" align="left" face="Arial, Helvetica, sans-serif" color="#222222">

                                                                </font>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        
                    </tbody>
                </table>
            </td>
        </tr>
        
       
    </tbody>
</table>