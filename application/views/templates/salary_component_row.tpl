<tr>
    <td>
        <input type="text" class="form-control component_name" id="component_name_{{$index}}" name="component_name[{{$index}}]" placeholder="Enter Component Name" />
    </td>
    <td>
        <select class="form-select component_type" id="component_type_{{$index}}" name="component_type[{{$index}}]">
            <option value="">Select Component Type</option>
            {foreach from=$component_type_arr item=component_type}
            <option value="{$component_type.id}">{$component_type.val}</option>
            {/foreach}
        </select>
    </td>
    <td>
        <select class="form-select value_type" id="value_type_{{$index}}" name="value_type[{{$index}}]">
            <option value="">Select Type</option>
            {foreach from=$value_type_arr item=value_type}
            <option value="{$value_type.id}">{$value_type.val}</option>

            {/foreach}
        </select>
    </td>
    <td>
        <input type="text" class="form-control component_value number-formatter" id="component_value_{{$index}}" name="component_value[{{$index}}]" placeholder="Enter Component Value" />
    </td>
    <td class="text-center">
        <input type="checkbox" class="form-check-input is_compulsory" id="is_compulsory_{{$index}}" name="is_compulsory[{{$index}}]" value="Yes"/>
    </td>
    <td>
        <textarea class="form-control description" id="description_{{$index}}" placeholder="Enter Description" name="description[{{$index}}]"></textarea>
    </td>
    <td class="text-center" >
        <i class="ti ti-trash delete-row" title="Delete"></i>
    </td>
</tr>
