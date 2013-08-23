-----------------------------------
-- Area: Crawler's Nest
-- NPC:  Matron Crawler
-- @pos -141.158 -33.689 20.944 197
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(17584457):hideNPC(900);
end;