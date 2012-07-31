-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Suzaku
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
	killer:showText(mob,SKY_GOD_OFFSET + 8);
	GetNPCByID(17310048):hideNPC(900);
end;