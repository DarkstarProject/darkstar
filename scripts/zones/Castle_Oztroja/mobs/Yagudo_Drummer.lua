-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Yagudo_Drummer
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Mee_Deggi_the_Punisher_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Mee_Deggi_the_Punisher");
        if (ToD <= os.time(t) and GetMobAction(Mee_Deggi_the_Punisher) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Mee_Deggi_the_Punisher);
                GetMobByID(Mee_Deggi_the_Punisher):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Mee_Deggi_the_Punisher", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;

