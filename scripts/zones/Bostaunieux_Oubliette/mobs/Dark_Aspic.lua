-----------------------------------
--  Area: Bostaunieux Oubliette (167)
--   Mob: Dark_Aspic
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    checkGoVregime(killer,mob,610,1); -- Check GOV Page

    local mob = mob:getID();
    if (Sewer_Syrup_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Sewer_Syrup");
        if (ToD <= os.time(t) and GetMobAction(Sewer_Syrup) == 0) then
            if (math.random((1),(10)) == 5) then
                UpdateNMSpawnPoint(Sewer_Syrup);
                GetMobByID(Sewer_Syrup):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Sewer_Syrup", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

