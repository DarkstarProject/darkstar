----------------------------------
-- Area: Gustav Tunnel
--  MOB: Antares
-- Note: Place holder Amikiri
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,768,2);

    local mobID = mob:getID();
    if (Amikiri_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Amikiri");
        if (ToD <= os.time(t) and GetMobAction(Amikiri) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Amikiri);
                GetMobByID(Amikiri):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Amikiri", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
