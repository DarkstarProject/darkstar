-----------------------------------
-- Area: Monastic Cavern
--  MOB: Overlord Bakgodek
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Monastic_Cavern/TextIDs");
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORC_KING_ENGAGE);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OVERLORD_OVERTHROWER);
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORC_KING_DEATH);
end;