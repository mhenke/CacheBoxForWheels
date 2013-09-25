<div>
				<p>CacheBox is a enterprise caching engine, aggregator and API for ColdFusion applications. It is part of the ColdBox 3.0.0 Platform but it can also function on its own as a standalone framework. <a href="http://wiki.coldbox.org/wiki/CacheBox.cfm">http://wiki.coldbox.org/wiki/CacheBox.cfm</a></p>
<p>REQUIRED: Drop CacheBox inside the webroot folder in your Wheels application.</p>
			</div>
			
<!---  Import Report Tags: use /cachebox/system if using standalone --->
<cfimport prefix="cachebox" taglib="/coldbox/system/cache/report">

<!---  Create CacheBox with default configuration --->
<cfif structKeyExists(url,"reinit") OR NOT structKeyExists(application,"cacheBox")>
    <cfset application.cacheBox   = createObject("component","coldbox.system.cache.CacheFactory").init()>
<cfelse>
    <cfset cachebox = application.cacheBox>
</cfif>

<cfoutput>
<html>

    <head>
        <title>CacheBox Monitor Tool</title>
    </head>
    <body>

    <!---  Special ToolBar --->
    <div id="toolbar">
        <input type="button" value="Reinit" onclick="window.location='index.cfm?reinit'"/>
    </div>
    
    <!---  Render Report Here --->
    <cachebox:monitor cacheFactory="#cacheBox#"/>

    </body>
</html>
</cfoutput>