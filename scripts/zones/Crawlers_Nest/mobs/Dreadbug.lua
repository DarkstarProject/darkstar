-----------------------------------
-- Area: Crawlers Nest
-- NM:   Dreadbug
-- Used in Quests: A Boy's Dream
-- @zone 197
-- @pos -18 -8 124
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)
	killer:setVar("DreadbugNM_Timer",VanadielDayOfTheYear());
	killer:setVar("NM_Spawned",0);
end;