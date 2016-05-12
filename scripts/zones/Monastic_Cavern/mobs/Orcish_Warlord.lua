-----------------------------------
-- Area: Monastic Cavern
--  MOB: Orcish Warlord (Overlord Bakgodek PH)
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
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
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORCISH_WARLORD_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORCISH_WARLORD_DEATH);
    mob:setRespawnTime(math.random(75600,86400)); -- 21 to 24 hours
end;