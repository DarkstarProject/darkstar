-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Kirin
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
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
	killer:setTitle(KIRIN_CAPTIVATOR);
	killer:showText(mob,KIRIN_OFFSET + 1);
	GetNPCByID(17506693):hideNPC(900);
end;