{if $readonly}
<input type="hidden" name="fm_{$fd_field}" id="fm_{$fd_field}" value="{$value}" />
{/if}
<select name="fm_{$fd_field}" id="fm_{$fd_field}" size="{$rows}" {if $error != ""}class="error"{/if} {if $readonly}readonly="readonly"{/if} title="{$fd_help}"{if $allextras} onchange="{foreach from=$allextras item=ae}$('#row_{$ae}').hide();{/foreach}{foreach from=$options item=o}{if $o.extra} if($(this).val()=='{$o.value}'){ldelim}$('#row_{$o.extra}').show(); {rdelim}{/if}{/foreach}"{/if}>
    <option value=""></option>
    {foreach from=$options key=k item=item}
    {if isset($item.group) && $item.group != "" && $item.group != $item.group}<optgroup label="{$item.gruppe}">{/if}
        <option value="{$item.value}" {if $value == $item.value}selected="selected"{/if}>{$item.name}</option>
    {if isset($item.group) && $item.group != "" && $item.group != $item.group}</optgroup>{/if}
    {/foreach}
</select>

{*
{foreach from=$options key=k item=item}
{if $item.extra}<div id="fm_{$fd_field}_extra_{$item.value}" style="">{$item.extra} (fm_{$fd_field}_extra_{$item.value})</div>{/if}
{/foreach}
*}