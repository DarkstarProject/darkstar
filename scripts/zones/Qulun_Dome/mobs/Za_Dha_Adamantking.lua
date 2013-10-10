-----------------------------------
-- Area: Qulun_Dome
-- NPC:  Za_Dha_Adamantking
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function OnMobEngaged(mob,target)
-- mob:messagePublic(QUADAV_KING_ENGAGE,mob);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
		killer:addTitle(ADAMANTKING_USURPER);
-- mob:messagePublic(QUADAV_KING_DEATH,mob);
end;