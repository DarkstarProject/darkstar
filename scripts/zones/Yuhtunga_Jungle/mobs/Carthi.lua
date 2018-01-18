-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Carthi
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller and GetMobByID(TIPHA):isDead()) then
        GetNPCByID(YUHTUNGA_CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
