----------------------------------
-- Area: Gustav Tunnel
--  MOB: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,769,2);

    local mobID = mob:getID();
    if (Ungur_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Ungur");
        if (ToD <= os.time(t) and GetMobAction(Ungur) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Ungur);
                GetMobByID(Ungur):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Ungur", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
