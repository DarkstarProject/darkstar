-----------------------------------
--  Area: Giddeus (145)
--   Mob: Yagudo_Piper
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    mob = mob:getID();
    if (Vuu_Puqu_the_Beguiler_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Vuu_Puqu_the_Beguiler");
        if (ToD <= os.time(t) and GetMobAction(Vuu_Puqu_the_Beguiler) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Vuu_Puqu_the_Beguiler);
                GetMobByID(Vuu_Puqu_the_Beguiler):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Vuu_Puqu_the_Beguiler", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;

