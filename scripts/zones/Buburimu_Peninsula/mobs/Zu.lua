-----------------------------------
--  Area: Buburimu Peninsula (118)
--   Mob: Zu
-----------------------------------

require("scripts/zones/Buburimu_Peninsula/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    local mob = mob:getID();
    if (Helldiver_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Helldiver");
        if (ToD <= os.time(t) and GetMobAction(Helldiver) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Helldiver);
                GetMobByID(Helldiver):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Helldiver", mob);
                DeterMob(mob, true);
            end
        end
    end
    
end;

