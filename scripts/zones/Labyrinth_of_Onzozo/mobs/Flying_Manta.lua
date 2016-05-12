-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,774,1);

    local mobID = mob:getID();
    if (Lord_of_Onzozo_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Lord_of_Onzozo");
        if (ToD <= os.time(t) and GetMobAction(Lord_of_Onzozo) == 0) then
            if (math.random(1,25) == 5) then
                UpdateNMSpawnPoint(Lord_of_Onzozo);
                GetMobByID(Lord_of_Onzozo):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Lord_of_Onzozo", mobID);
                DeterMob(mobID, true);
            end
        end
    elseif (Peg_Powler_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Peg_Powler");
        if (ToD <= os.time(t) and GetMobAction(Peg_Powler) == 0) then
            if (math.random(1,25) == 5) then
                UpdateNMSpawnPoint(Peg_Powler);
                GetMobByID(Peg_Powler):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Peg_Powler", mobID);
                DeterMob(mobID, true);
            end
        end
    end;
end;
