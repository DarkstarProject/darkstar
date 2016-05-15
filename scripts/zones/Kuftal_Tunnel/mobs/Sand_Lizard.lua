-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,735,2);

    local mobID = mob:getID();
    if (Amemet_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Amemet");
        if (ToD <= os.time(t) and GetMobAction(Amemet) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Amemet);
                GetMobByID(Amemet):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Amemet", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
