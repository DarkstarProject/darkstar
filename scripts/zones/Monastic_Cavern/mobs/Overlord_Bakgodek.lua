-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Overlord Bakgodek
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Monastic_Cavern/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
-- mob:messagePublic(mob,ORC_KING_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
		killer:addTitle(OVERLORD_OVERTHROWER);
-- mob:messagePublic(mob,ORC_KING_DEATH);
end;