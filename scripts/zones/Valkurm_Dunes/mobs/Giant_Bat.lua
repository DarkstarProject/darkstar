-----------------------------------
-- Area: Valkurm Dunes (103)
--  Mob: Giant_Bat
--  PH for Golden Bat
-----------------------------------

require("scripts/zones/Valkurm_Dunes/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Golden_Bat_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Golden_Bat");
        if (ToD <= os.time(t) and GetMobAction(Golden_Bat) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Golden_Bat);
                GetMobByID(Golden_Bat):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Golden_Bat", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;