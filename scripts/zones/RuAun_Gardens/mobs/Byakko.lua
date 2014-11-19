-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Byakko
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
	killer:showText(mob,SKY_GOD_OFFSET + 12);
	GetNPCByID(17310051):hideNPC(120);
end;