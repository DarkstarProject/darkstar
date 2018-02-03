-----------------------------------
-- Area: Monastic Cavern
--  MOB: Orcish Warlord (Overlord Bakgodek PH)
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Monastic_Cavern/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORCISH_WARLORD_ENGAGE);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORCISH_WARLORD_DEATH);
    mob:setRespawnTime(math.random(75600,86400)); -- 21 to 24 hours
end;