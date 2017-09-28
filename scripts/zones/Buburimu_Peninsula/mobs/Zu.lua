-----------------------------------
-- Area: Buburimu Peninsula (118)
--  MOB: Zu
-----------------------------------

require("scripts/zones/Buburimu_Peninsula/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local mobID = mob:getID();
    if (Helldiver_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Helldiver");
        local checkPH = GetServerVariable("[PH]Helldiver");
        if (ToD <= os.time() and GetMobAction(Helldiver) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Helldiver);
                GetMobByID(Helldiver):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Helldiver", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;

