-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Tipha
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller and GetMobByID(CARTHI):isDead()) then
        GetNPCByID(CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
