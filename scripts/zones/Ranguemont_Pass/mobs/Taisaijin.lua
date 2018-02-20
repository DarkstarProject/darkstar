-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Taisaijin
-----------------------------------
require("scripts/zones/Ranguemont_Pass/MobIDs");
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(BYEBYE_TAISAI);
end;

function onMobDespawn(mob)
    local phIndex = mob:getLocalVar("phIndex");
    local ph = GetMobByID(TAISAIJIN_PH[phIndex]);

    -- allow current placeholder to respawn
    DisallowRespawn(mob:getID(), true);
    DisallowRespawn(ph:getID(), false);
    ph:setRespawnTime(GetMobRespawnTime(ph:getID()));

    -- pick next placeholder
    phIndex = (phIndex % 3) + 1;
    ph = GetMobByID(TAISAIJIN_PH[phIndex]);
    ph:setLocalVar("timeToGrow", os.time() + math.random(86400,259200)); -- 1 to 3 days
    ph:setLocalVar("phIndex",phIndex);
end;
