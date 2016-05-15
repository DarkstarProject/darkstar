-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Clipper
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,731,1);

    local mobID = mob:getID();
    if (Cargo_Crab_Colin_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Cargo_Crab_Colin");
        if (ToD <= os.time(t) and GetMobAction(Cargo_Crab_Colin) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Cargo_Crab_Colin);
                GetMobByID(Cargo_Crab_Colin):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Cargo_Crab_Colin", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

