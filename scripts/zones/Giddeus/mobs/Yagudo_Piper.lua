-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Piper
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Vuu_Puqu_the_Beguiler_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Vuu_Puqu_the_Beguiler");
        if (ToD <= os.time(t) and GetMobAction(Vuu_Puqu_the_Beguiler) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Vuu_Puqu_the_Beguiler);
                GetMobByID(Vuu_Puqu_the_Beguiler):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Vuu_Puqu_the_Beguiler", mobID);
                DeterMob(mobID, true);
            end
        end
    end
  
end;

