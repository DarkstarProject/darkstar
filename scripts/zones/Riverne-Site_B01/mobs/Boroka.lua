-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Boroka
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
	killer:addTitle(BOROKA_BELEAGUERER);
end;