{*-------------------------------------------------------+
| Project 60 - SEPA direct debit                         |
| Copyright (C) 2013-2014 SYSTOPIA                       |
| Author: B. Endres (endres -at- systopia.de)            |
| http://www.systopia.de/                                |
+--------------------------------------------------------+
| This program is released as free software under the    |
| Affero GPL license. You can redistribute it and/or     |
| modify it under the terms of this license which you    |
| can read by viewing the included agpl.txt or online    |
| at www.gnu.org/licenses/agpl.html. Removal of this     |
| copyright header is strictly prohibited without        |
| written permission from the original author(s).        |
+-------------------------------------------------------*}

{* Create a link to the settings page *}
{capture assign=sepa_settings_link}{crmURL p="civicrm/admin/setting/sepa"}{/capture}

{* Create creditors dropdown for pp *}
{if $creditors}
<select id="creditor_id" name="user_name">
  {foreach from=$creditors item=creditor key=id}
  <option value="{$id}" {if $id eq $user_name}selected{/if}>{$creditor.name}&nbsp;[{$id}]</option>
  {/foreach}
</select>
{else}
<span id="creditor_id"><p><strong>{ts}No creditor found! Please create a creditor on the <a href="{$sepa_settings_link}">SEPA settings page</a>.{/ts}</strong></p></span>
{/if}

{* Create creditors dropdown help *}
<a id='creditor_id_help' onclick='CRM.help("{ts}Creditor{/ts}", {literal}{"id":"id-creditor-help","file":"CRM\/Admin\/Form\/PaymentProcessor/SDD"}{/literal}); return false;' href="#" title="{ts}Help{/ts}" class="helpicon">&nbsp;</a>

{* create cycle day field *}
<table>
<tr id="cycle_day_field" class="crm-paymentProcessor-form-block-{$form.cycle_day.name}">
  <td class="label">
    {ts}Cycle Day{/ts}
  </td>
  <td>
    <select id="cycle_day" name="cycle_day">
        {foreach from=$cycle_days item=day}
        <option value="{$day}" {if $day eq $cycle_day}selected{/if}>{$day}</option>
        {/foreach}
    </select>
    <a id='cycle_day_help' onclick='CRM.help("{ts}Cycle Day{/ts}", {literal}{"id":"id-cycle_day-help","file":"CRM\/Admin\/Form\/PaymentProcessor/SDD"}{/literal}); return false;' href="#" title="{ts}Help{/ts}" class="helpicon">&nbsp;</a>
  </td>
</tr>
</table>


{* Create creditors dropdown for test pp *}
{if $creditors}
<select id="test_creditor_id" name="test_user_name">
  {foreach from=$test_creditors item=creditor key=id}
  <option value="{$id}" {if $id eq $test_user_name}selected{/if}>{$creditor.name}&nbsp;[{$id}]</option>
  {/foreach}
</select>
{else}
<span id="test_creditor_id"><p><strong>{ts}No creditor found! Please create a creditor on the <a href="{$sepa_settings_link}">SEPA settings page</a>.{/ts}</strong></p></span>
{/if}

{* Create test creditors dropdown help *}
<a id='test_creditor_id_help' onclick='CRM.help("{ts}Creditor{/ts}", {literal}{"id":"id-creditor-help","file":"CRM\/Admin\/Form\/PaymentProcessor/SDD"}{/literal}); return false;' href="#" title="{ts}Help{/ts}" class="helpicon">&nbsp;</a>

{* create test cycle day field *}
<table>
<tr id="test_cycle_day_field" class="crm-paymentProcessor-form-block-{$form.test_cycle_day.name}">
  <td class="label">
    {ts}Cycle Day{/ts}
  </td>
  <td>
    <select id="test_cycle_day" name="test_cycle_day">
        {foreach from=$test_cycle_days item=day}
        <option value="{$day}" {if $day eq $test_cycle_day}selected{/if}>{$day}</option>
        {/foreach}
    </select>
    <a id='cycle_day_help' onclick='CRM.help("{ts}Cycle Day{/ts}", {literal}{"id":"id-cycle_day-help","file":"CRM\/Admin\/Form\/PaymentProcessor/SDD"}{/literal}); return false;' href="#" title="{ts}Help{/ts}" class="helpicon">&nbsp;</a>
  </td>
</tr>
</table>





<script type="text/javascript">

{literal}
// remove unnecessary lines
cj('#url_site').parent().parent().remove();
cj('#url_recur').parent().parent().remove();
cj('#test_url_site').parent().parent().remove();
cj('#test_url_recur').parent().parent().remove();

// adjust help text
cj('.crm-paymentProcessor-form-block-user_name').find('.helpicon').replaceWith(cj('#creditor_id_help'));
cj('.crm-paymentProcessor-form-block-test_user_name').find('.helpicon').replaceWith(cj('#test_creditor_id_help'));

// replace creditor selector
cj('#user_name').replaceWith(cj('#creditor_id'));
cj('#test_user_name').replaceWith(cj('#test_creditor_id'));

// append cycle day
cj('tr.crm-paymentProcessor-form-block-user_name').parent().append(cj('#cycle_day_field'));
cj('tr.crm-paymentProcessor-form-block-test_user_name').parent().append(cj('#test_cycle_day_field'));
</script>
{/literal}
