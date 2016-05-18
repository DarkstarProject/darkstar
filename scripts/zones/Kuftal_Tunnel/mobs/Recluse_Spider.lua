-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Recluse Spider
-- Note: Place Holder for Arachne
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,737,2);
    checkGoVregime(player,mob,739,2);

    local mobID = mob:getID();
    if (Arachne_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Arachne");
        if (ToD <= os.time(t) and GetMobAction(Arachne) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Arachne);
                GetMobByID(Arachne):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Arachne", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
