-----------------------------------
--  Area: Castle Zvahl Keep (162)
--   Mob: Demon_Pawn
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Baronet_Romwe_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Baronet_Romwe");
        if (ToD <= os.time(t) and GetMobAction(Baronet_Romwe) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Baronet_Romwe);
                GetMobByID(Baronet_Romwe):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Baronet_Romwe", mob);
                DeterMob(mob, true);
            end
        end
    end

end;