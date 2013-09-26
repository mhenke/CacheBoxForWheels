<cfcomponent>
	 <cffunction name="init">
		<cfset this.version = "1.2">
		<cfreturn this>
	</cffunction>
	
<cffunction name="$addToCache" returntype="void" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="value" type="any" required="true">
	<cfargument name="time" type="numeric" required="false" default="#application.wheels.defaultCacheTime#">
	<cfargument name="category" type="string" required="false" default="main">
	<cfscript>
		var loc = {}; 
		loc.agent = application.wheels.caches[arguments.category]; 
		loc.agent.set(arguments.key,duplicate(arguments.value)); 
	</cfscript>
</cffunction>

<cffunction name="$getFromCache" returntype="any" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="category" type="string" required="false" default="main">
	<cfscript>
		var loc = {}; 
		loc.returnValue = false; 
		loc.cache = application.wheels.caches[arguments.category].get(key); 
		if (isDefined("loc.cache")) { 
			
			// we found cache and it's still valid 
			loc.returnValue = duplicate(loc.cache); // if it's a struct or object, we don't want to make changes to the cache after returning it 
		} 
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="$removeFromCache" returntype="void" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="category" type="string" required="false" default="main">
	<cfset application.wheels.caches[arguments.category].clear(key) />
</cffunction>

<cffunction name="$clearCache" returntype="void" access="public" output="false">
	<cfargument name="category" type="string" required="false" default="#structKeyList(application.wheels.caches)#">
	<cfscript>
		var loc = {};
		var agent = listToArray(category); 
		var i = 0; 
		
		for (i = 1; i lte arrayLen(agent); i = i + 1) { 
			application.wheels.caches[agent[i]].clearAll(); 
		} 
	</cfscript>
	
</cffunction>

</cfcomponent>