-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
-- NPC:  Bahamut
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(WYRM_ASTONISHER);
end;