-----------------------------------
-- Area: Monastic Cavern
-- MOB: Orcish Warlord (Overlord Bakgodek PH)
-----------------------------------
local text = require("scripts/zones/Monastic_Cavern/TextIDs");

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

function onMobDeath(mob,killer,ally)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob,ORCISH_WARLORD_DEATH);
    mob:setRespawnTime(math.random(75600,86400)); -- 21 to 24 hours
end;