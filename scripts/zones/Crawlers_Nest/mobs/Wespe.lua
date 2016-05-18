-----------------------------------
--  Area: Crawlers' Nest (197)
--   Mob: Wespe
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Crawlers_Nest/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,691,2);

    local mobID = mob:getID();
    if (Demonic_Tiphia_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Demonic_Tiphia");
        if (ToD <= os.time(t) and GetMobAction(Demonic_Tiphia) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Demonic_Tiphia);
                GetMobByID(Demonic_Tiphia):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Demonic_Tiphia", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
