-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Genbu
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
	killer:showText(mob,SKY_GOD_OFFSET + 6);
	GetNPCByID(17310098):hideNPC(120);
end;