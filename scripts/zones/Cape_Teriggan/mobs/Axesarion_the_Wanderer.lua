-----------------------------------
-- Area: Cape Teriggan
--  NM:  Axesarion the Wanderer
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Cape_Teriggan/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        GetNPCByID(CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
