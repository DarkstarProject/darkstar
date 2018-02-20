-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Doomed Pilgrims
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        GetNPCByID(ZITAH_CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
