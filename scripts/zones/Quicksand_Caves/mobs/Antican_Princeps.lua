-----------------------------------
-- Area: Quicksand Caves
--  MOB: Antican Princeps
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Quicksand_Caves/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,812,2);
    checkGoVregime(player,mob,813,2);
    checkGoVregime(player,mob,814,2);
    checkGoVregime(player,mob,815,1);
    checkGoVregime(player,mob,816,2);
    checkGoVregime(player,mob,817,2);
    checkGoVregime(player,mob,818,2);
    checkGoVregime(player,mob,819,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- if this mob is a PH for NM and we're past the NM's cooldown
    -- then give a 10% chance to spawn NM in place of PH.
    local mobID = mob:getID();
    if (Sagittarius_X_XIII_PH[mobID] ~= nil) then
        local windowOpen = GetServerVariable("[POP]Sagittarius_X_XIII");
        if (windowOpen <= os.time(t) and GetMobAction(Sagittarius_X_XIII) == 0) then
            if (math.random(1,10) == 1) then
                UpdateNMSpawnPoint(Sagittarius_X_XIII);
                GetMobByID(Sagittarius_X_XIII):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Sagittarius_X_XIII", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
