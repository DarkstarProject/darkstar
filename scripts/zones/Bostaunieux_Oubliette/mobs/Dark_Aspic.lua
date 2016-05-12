-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Dark_Aspic
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,610,1); -- Check GOV Page

    local mobID = mob:getID();
    if (Sewer_Syrup_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Sewer_Syrup");
        if (ToD <= os.time(t) and GetMobAction(Sewer_Syrup) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Sewer_Syrup);
                GetMobByID(Sewer_Syrup):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Sewer_Syrup", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

