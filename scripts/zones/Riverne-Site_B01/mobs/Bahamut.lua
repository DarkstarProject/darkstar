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
	killer:addTitle(WYRM_ASTONISHER);
end;