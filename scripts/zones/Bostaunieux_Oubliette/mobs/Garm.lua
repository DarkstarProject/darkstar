-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Garm
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,612,1);

    local mobID = mob:getID();
    if (Shii_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Shii");
        if (ToD <= os.time(t) and GetMobAction(Shii) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Shii);
                GetMobByID(Shii):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Shii", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

