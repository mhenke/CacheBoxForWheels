CacheBox: The Enterprise ColdFusion Caching Engine, Aggregator and API
http://www.coldbox.org/download
http://wiki.coldbox.org/wiki/CacheBox.cfm

requires:
# CFWheels 1.2
# CacheBox 1.5

Simple Instructions
1) Download Cachebox http://www.coldbox.org/download
2) Unzip the Cachebox framework is in your webroot (should be under webroot called cachebox)
2.a) Extract the coldbox folder aswell if you would like the admin area to work
3) Place the CFWheels plugin (CacheBoxCB-xx.xx.zip) in the plugins folder
4) Add the settings listed in the readme.txt to events/onapplicationstart.cfm
5) Reloaded CFWheels (?reload=true) 

Detailed Instructions
Download Cachebox
Unzip cachebox's zip and place in webroot of with the cfwheels application.

Exampe Of Directory Layout:
webroot
==index.cfm
==Application.cfc
====wheels
====views
====controllers
====coldbox
====cachebox
=====system
======cache

In events/onapplicationstart.cfm place this code:

<!--- Begin Initializing Cachbox --->

<cfset loc.cacheBox = createObject("component","cachebox.system.cache.CacheFactory").init()>

<cfloop list="#application.wheels.cacheCategories#" index="category">
	<cfset application.wheels.caches[category] = loc.cachebox.addDefaultCache("wheels_#category#")>
</cfloop>

<!--- End Initializing Cachbox --->

Place the CacheBoxCB-xx.xx.zip plugin in the plugins folder of cfwheels

Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true

You should be good to go now.

CacheBox Admin: Available

=== Contributors ==== 

Please add yourself if you helped

Tim Badolato (tim@dreamstonemedia.com) - https://github.com/timsayshey

Mike Henke (henke.mike@gmail.com) - https://github.com/mhenke/

 ==== Git Workflow for Contributors ====

This project uses the excellent "Git Workflow series":http://www.silverwareconsulting.com/index.cfm/Git-Workflow/ by "Bob Silverburg":https://github.com/bobsilverberg/ for contributions.