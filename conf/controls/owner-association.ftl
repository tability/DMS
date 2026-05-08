<#include "common/picker.inc.ftl" />

<#assign controlId = fieldHtmlId + "-cntrl">

<script type="text/javascript">//<![CDATA[
(function()
{
   <@renderPickerJS field "picker" />
   picker.setOptions(
   {
      itemType: "${field.endpointType?js_string}",
      multipleSelectMode: ${field.endpointMany?string},
      parentNodeRef: "alfresco://company/home",
      displayMode: "${(field.control.params.displayMode!"items")?js_string}"
   });
})();
//]]></script>

<div class="form-field">
   <#if form.mode == "view">
      <div id="${controlId}" class="viewmode-field">
         <span class="viewmode-label">${field.label?html}:</span>
         <span id="${controlId}-currentValueDisplay" class="viewmode-value current-values">
            <#-- показуємо fullname замість nodeRef -->
            <#if field.value?? && field.value != "">
               <#list field.value?split(",") as assoc>
                  ${assoc.properties["emp:fullName"]!assoc}
               </#list>
            </#if>
         </span>
      </div>
   <#else>
      <label for="${controlId}">${field.label?html}:</label>
      <div id="${controlId}" class="object-finder">
         <div id="${controlId}-currentValueDisplay" class="current-values"></div>
         <#if field.disabled == false>
            <input type="hidden" id="${fieldHtmlId}" name="-" value="${field.value?html}" />
            <input type="hidden" id="${controlId}-added" name="${field.name}_added" />
            <input type="hidden" id="${controlId}-removed" name="${field.name}_removed" />
            <div id="${controlId}-itemGroupActions" class="show-picker"></div>
            <@renderPickerHTML controlId />
         </#if>
      </div>
   </#if>
</div>
