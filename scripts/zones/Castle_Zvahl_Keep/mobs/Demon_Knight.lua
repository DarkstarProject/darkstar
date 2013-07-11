-----------------------------------
--  Area: Castle Zvahl Keep (162)
--   Mob: Demon_Knight
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Count_Bifrons_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Count_Bifrons");
        if (ToD <= os.time(t) and GetMobAction(Count_Bifrons) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Count_Bifrons);
                GetMobByID(Count_Bifrons):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Count_Bifrons", mob);
                DeterMob(mob, true);
            end
        end
    end
end;