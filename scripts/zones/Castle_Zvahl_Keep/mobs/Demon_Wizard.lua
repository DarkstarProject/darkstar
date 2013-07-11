-----------------------------------
--  Area: Castle Zvahl Keep (162)
--   Mob: Demon_Wizard
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Baron_Vapula_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Baron_Vapula");
        if (ToD <= os.time(t) and GetMobAction(Baron_Vapula) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Baron_Vapula);
                GetMobByID(Baron_Vapula):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Baron_Vapula", mob);
                DeterMob(mob, true);
            end
        end
    end

end;