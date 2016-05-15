-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Deinonychus
-- Note: Place Holder for Yowie
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,740,1);

    local mobID = mob:getID();
    if (Yowie_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Yowie");
        if (ToD <= os.time(t) and GetMobAction(Yowie) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Yowie);
                GetMobByID(Yowie):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Yowie", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
