----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);

    local mobID = mob:getID();
    if (Goblinsavior_Heronox_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Goblinsavior_Heronox");
        if (ToD <= os.time(t) and GetMobAction(Goblinsavior_Heronox) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Goblinsavior_Heronox);
                GetMobByID(Goblinsavior_Heronox):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Goblinsavior_Heronox", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
