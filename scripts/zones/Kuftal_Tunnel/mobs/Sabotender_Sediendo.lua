-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sabotender Sediendo
-- Note: Place Holder for Sabotender Mariachi
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,738,2);

    local mobID = mob:getID();
    if (Sabotender_Mariachi_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Sabotender_Mariachi");
        if (ToD <= os.time(t) and GetMobAction(Sabotender_Mariachi) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Sabotender_Mariachi);
                GetMobByID(Sabotender_Mariachi):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Sabotender_Mariachi", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
