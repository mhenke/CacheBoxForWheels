<cfif StructKeyExists(URL, "plugin")>
	<cfset pluginManager.installPlugin(URL.plugin)>
</cfif>

<cflocation url="/cachebox/index.cfm" />