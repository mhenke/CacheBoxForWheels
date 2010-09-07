CacheBox: The Enterprise ColdFusion Caching Engine, Aggregator and API
http://www.coldbox.org/download
http://wiki.coldbox.org/wiki/CacheBox.cfm

requires:
# CFWheels 1.0.5
# CacheBox 1.0

Simple Instructions
1) Download Cachebox http://www.coldbox.org/download
2) Unzip the Cachebox framework is in your webroot (should be under webroot called cachebox)
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
====cachebox
=====system
======cache

In events/onapplicationstart.cfm place this code:

<cfscript>
loc.cacheBox = createObject("component","cachebox.system.cache.CacheFactory").init();

application.wheels.cache.sql = loc.cachebox.addDefaultCache("wheels_sql");
application.wheels.cache.image = loc.cachebox.addDefaultCache("wheels_image");
application.wheels.cache.main = loc.cachebox.addDefaultCache("wheels_main");
application.wheels.cache.action = loc.cachebox.addDefaultCache("wheels_action");
application.wheels.cache.page = loc.cachebox.addDefaultCache("wheels_page");
application.wheels.cache.partial = loc.cachebox.addDefaultCache("wheels_partial");
application.wheels.cache.query = loc.cachebox.addDefaultCache("wheels_query");
</cfscript>

Place the CacheBoxCB-xx.xx.zip plugin in the plugins folder of cfwheels

Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true

You should be good to go now.

CacheBox Admin: Will be available soon