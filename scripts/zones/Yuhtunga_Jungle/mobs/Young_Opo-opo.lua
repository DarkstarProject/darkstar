-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Young Opo-opo
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Yuhtunga_Jungle/MobIDs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,126,1);
    checkRegime(player,mob,128,1);
end;

function onMobDespawn(mob)
    if (mob:getID() == MISCHIEVOUS_MICHOLAS_PH) then
        local nm = GetMobByID(MISCHIEVOUS_MICHOLAS);
        if (os.time() > nm:getLocalVar("repop") and not nm:isSpawned() and math.random(1,100) <= 20) then
            DisallowRespawn(mob:getID(), true);
            DisallowRespawn(MISCHIEVOUS_MICHOLAS, false);
            nm:setRespawnTime(GetMobRespawnTime(MISCHIEVOUS_MICHOLAS_PH));
        end
    end
end;
