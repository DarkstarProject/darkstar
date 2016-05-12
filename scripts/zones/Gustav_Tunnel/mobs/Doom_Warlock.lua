----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Warlock
-- Note: Place holder Taxim
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,765,2);
    checkGoVregime(player,mob,766,1);
    checkGoVregime(player,mob,769,1);

    local mobID = mob:getID();
    if (Taxim_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Taxim");
        if (ToD <= os.time(t) and GetMobAction(Taxim) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Taxim);
                GetMobByID(Taxim):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Taxim", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
