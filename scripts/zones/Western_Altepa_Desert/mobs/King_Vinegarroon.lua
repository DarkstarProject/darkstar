-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  King Vinegarroon
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
	killer:addTitle(VINEGAR_EVAPORATOR);
end;