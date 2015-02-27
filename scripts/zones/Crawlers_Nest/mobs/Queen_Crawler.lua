-----------------------------------
-- Area: Crawlers Nest
-- NPC:  Queen Crawler
-- @pos -337.156 -3.607 -253.294 197
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	GetNPCByID(17584459):hideNPC(900); -- qm5
end;