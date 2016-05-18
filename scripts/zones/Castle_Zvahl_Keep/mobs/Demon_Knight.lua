-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Knight
-- Notes: PH for Count lolBifrons
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Count_Bifrons_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Count_Bifrons");
        if (ToD <= os.time(t) and GetMobAction(Count_Bifrons) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Count_Bifrons);
                GetMobByID(Count_Bifrons):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Count_Bifrons", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;