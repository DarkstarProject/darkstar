-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Birdtrap
-- Note: Placeholder Orctrap
-----------------------------------

require("scripts/zones/Carpenters_Landing/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Get Birdtrap ID and check if it is a PH of Orctrap
    local mobID = mob:getID();

    -- Check if Birdtrap is within the Orctrap_PH table
    if (Orctrap_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Orctrap previous ToD
        local Orctrap_ToD = GetServerVariable("[POP]Orctrap");

        -- Check if Orctrap window is open, and there is not an Orctrap popped already(ACTION_NONE = 0)
        if (Orctrap_ToD <= os.time(t) and GetMobAction(Orctrap) == 0) then

            -- printf("Orctrap window open");
            -- Give Birdtrap 5 percent chance to pop Orctrap
            if (math.random(1,20) == 5) then
                -- printf("Orctrap will pop");
                UpdateNMSpawnPoint(Orctrap);
                GetMobByID(Orctrap):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Orctrap", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;