-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Doomed Pilgrims
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        GetNPCByID(CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
