-----------------------------------
--  Area: Korroloka Tunnel (173)
--   Mob: Huge_Spider
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,279,1);

    local mobID = mob:getID();
    if (Falcatus_Aranei_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Falcatus_Aranei");
        if (ToD <= os.time(t) and GetMobAction(Falcatus_Aranei) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Falcatus_Aranei);
                GetMobByID(Falcatus_Aranei):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Falcatus_Aranei", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

