----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Mercenary
-- Note: Place holder Wyvernpoacher Drachlox
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
    if (Wyvernpoacher_Drachlox_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Wyvernpoacher_Drachlox");
        if (ToD <= os.time(t) and GetMobAction(Wyvernpoacher_Drachlox) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Wyvernpoacher_Drachlox);
                GetMobByID(Wyvernpoacher_Drachlox):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Wyvernpoacher_Drachlox", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
