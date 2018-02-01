-----------------------------------
-- Area: QuBia_Arena
-- Mission 9-2 SANDO
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/QuBia_Arena/MobIDs");
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_ORC);
end;

function onMobDeath(mob, player, isKiller)
    -- if all mobs in list are dead, victory
    local inst = player:getBattlefield():getBattlefieldNumber();
    for i,v in ipairs(HEIR_TO_THE_LIGHT_MOBLIST[inst]) do
        if (not GetMobByID(v):isDead()) then
            return;
        end
    end
    player:startEvent(32004,0,0,4);
end;
