-----------------------------------
-- Area: 
-- NPC:  Proto-Ultima
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/limbus");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TEMENOS_LIBERATOR);
	GetNPCByID(16928768+79):setPos(-559,5,-357);
	GetNPCByID(16928768+79):setStatus(STATUS_NORMAL);
	GetNPCByID(16928768+474):setStatus(STATUS_NORMAL);
end;