-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Tainted Flesh
-- Note: Place holder Hellion
-----------------------------------

require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Hellion_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Hellion");
        if (ToD <= os.time(t) and GetMobAction(Hellion) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Hellion);
                GetMobByID(Hellion):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Hellion", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
