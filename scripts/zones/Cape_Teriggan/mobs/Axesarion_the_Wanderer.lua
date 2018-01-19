-----------------------------------
-- Area: Cape Teriggan
--  NM:  Axesarion the Wanderer
-----------------------------------
require("scripts/zones/Cape_Teriggan/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        GetNPCByID(TERIGGAN_CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
