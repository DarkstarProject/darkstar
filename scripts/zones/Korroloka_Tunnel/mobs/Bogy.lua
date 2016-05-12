-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Bogy
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,732,1);

    local mobID = mob:getID();
    if (Dame_Blanche_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Dame_Blanche");
        if (ToD <= os.time(t) and GetMobAction(Dame_Blanche) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Dame_Blanche);
                GetMobByID(Dame_Blanche):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Dame_Blanche", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

