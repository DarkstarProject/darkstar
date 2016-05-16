-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Wizard
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Baron_Vapula_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Baron_Vapula");
        if (ToD <= os.time(t) and GetMobAction(Baron_Vapula) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Baron_Vapula);
                GetMobByID(Baron_Vapula):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Baron_Vapula", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;