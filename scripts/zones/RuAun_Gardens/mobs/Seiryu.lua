-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Seiryu
-----------------------------------
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:showText(mob,SKY_GOD_OFFSET + 10);
end;