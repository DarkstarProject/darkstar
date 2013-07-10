-----------------------------------
--  Area: Bostaunieux Oubliette (167)
--   Mob: Garm
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Shii_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Shii");
        if (ToD <= os.time(t) and GetMobAction(Shii) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Shii);
                GetMobByID(Shii):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Shii", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

