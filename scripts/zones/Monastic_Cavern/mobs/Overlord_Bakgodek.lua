-----------------------------------
-- Area: Monastic Cavern
--  MOB: Overlord Bakgodek
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Monastic_Cavern/TextIDs");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORC_KING_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(OVERLORD_OVERTHROWER);
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORC_KING_DEATH);
end;