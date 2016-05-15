-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Torama
-- Note: Place holder Ose
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,775,1);

    local mobID = mob:getID();
    if (Ose_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Ose");
        if (ToD <= os.time(t) and GetMobAction(Ose) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Ose);
                GetMobByID(Ose):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Ose", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
