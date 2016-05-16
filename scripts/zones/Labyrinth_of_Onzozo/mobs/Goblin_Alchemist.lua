-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Goblin Alchemist
-- Note: Place holder Soulstealer Skullnix
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,771,2);
    checkGoVregime(player,mob,772,2);
    checkGoVregime(player,mob,774,2);

    local mobID = mob:getID();
    if (Soulstealer_Skullnix_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Soulstealer_Skullnix");
        if (ToD <= os.time(t) and GetMobAction(Soulstealer_Skullnix) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Soulstealer_Skullnix);
                GetMobByID(Soulstealer_Skullnix):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Soulstealer_Skullnix", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;