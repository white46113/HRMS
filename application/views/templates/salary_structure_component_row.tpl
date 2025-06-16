
{if count($component_details) > 0}
	{foreach from=$component_details key=key_val item=component_val} 
	<tr class="row_{{$key_val}} {{if $component_val['used'] eq 'Yes' && $form_type eq 'salary_structure'}}used_component{{/if}} component_row">
		<input type="hidden" class="form-control component_id" id="component_id_{{$key_val}}" name="component_id[{{$key_val}}]" value="{{$component_val['salary_component_id']}}"  />
		<input type="hidden" class="form-control year_val" id="year_val_{{$key_val}}" name="year_val[{{$key_val}}]" value="{{$component_val['year']}}" />
		<input type="hidden" class="form-control description_val" id="description_val_{{$key_val}}" name="description_val[{{$key_val}}]" value="{{$component_val['description']}}" />
		<input type="hidden" class="form-control is_compulsory_val" id="is_compulsory_val_{{$key_val}}" name="is_compulsory_val[{{$key_val}}]" value="{{$component_val['is_compulsory']}}" />
	    <td class="text-center">
	    	<input type="hidden" class="form-control component_name_val" id="component_name_val_{{$key_val}}" name="component_name_val[{{$key_val}}]" value="{{$component_val['component_name']}}"  />
	    	{{$component_val['component_name']}} 
	    </td>
	    <td class="text-center">
	    	<input type="hidden" class="form-control component_type" id="component_type_{{$key_val}}" name="component_type[{{$key_val}}]" value="{{$component_val['component_type']}}"/>
	    	{{$component_val['component_type']}}
	    </td>
	    <td class="text-center">
	    	<input type="hidden" class="form-control value_type" id="value_type_{{$key_val}}" name="value_type[{{$key_val}}]" value="{{$component_val['value_type']}}"  />
	    
			{{if ($component_val['value_type'] == 'Decimal')}}
                                   Amount
                                    {{else}}
                                    {{$component_val['value_type']}}
                                    {{/if}}
	    </td>
	    <td class="text-center">
			{{if $component_val['value_type'] eq 'Percentage'}}
				<input type="text" class="form-control number_box_month number-formatter" id="component_value_{{$key_val}}" name="component_value_month[{{$key_val}}]"  placeholder="Enter Component Value" value="{{getNumberFormate($component_val['component_value'])}}">
			{{else}}
				<input type="text" class="form-control number_box_month number-formatter" id="component_value_{{$key_val}}" name="component_value_month[{{$key_val}}]"  placeholder="Enter Component Value" value="{{getNumberFormate($component_val['component_value']/12)}}">
			{{/if}}
			<input type="hidden" class="form-control number_box number-formatter"  name="component_value[{{$key_val}}]"  placeholder="Enter Component Value" value="{{getNumberFormate($component_val['component_value'])}}">
			
	    </td>
		<td class="text-center">
			{{if $component_val['value_type'] eq 'Percentage'}}
	    		<input disabled type="text" class="form-control month_number_box number-formatter"  placeholder="Component value per month" value="{{getNumberFormate($component_val['monthly'])}}">
			{{else}}
				<input disabled type="text" class="form-control month_number_box number-formatter"   placeholder="Component value per month" value="{{getNumberFormate($component_val['monthly'])}}">
			{{/if}}
		</td>
		<td class="text-center">
			{{if $component_val['value_type'] eq 'Percentage'}}
	    		<input disabled type="text" class="form-control year_number_box number-formatter"  placeholder="Component value per year" value="{{getNumberFormate($component_val['yearly'])}}">
			{{else}}
				<input disabled type="text" class="form-control year_number_box number-formatter"   placeholder="Component value per year" value="{{getNumberFormate($component_val['yearly'])}}">
			{{/if}}
	    </td>
	    <td class="text-center">
	        <input type="checkbox" class="form-check-input is_compulsory {{if $component_val['is_compulsory'] eq 'Yes'}} disabled_check  {{/if}}" id="is_compulsory_{{$key_val}}" name="is_compulsory[{{$key_val}}]"  {{if $component_val['is_compulsory'] eq 'Yes' || $component_val['used'] eq 'Yes'}}checked value="Yes" {{else}}value="No" {{/if}}/>
	    </td>
	    
	</tr>
	{/foreach} 

{else}
	<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty"><div class="p-3 no-data-found-block"><img class="p-2" src="http://localhost/extra_work/HRMS/public/assets/images/images/no_data_found_new.png" height="100" width="100"><br> No component data found..!</div></td></tr>
{/if}
