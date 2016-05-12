-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Demonic Rose
-- Note: Placeholder V. Vivian
-----------------------------------

require("scripts/zones/The_Boyahda_Tree/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Get Demonic Rose ID and check if it is a PH of Orctrap
    local mobID = mob:getID();

    -- Check if Demonic Rose is within the Voluptuous_Vivian_PH table
    if (Voluptuous_Vivian_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Demonic Rose previous ToD
        local Voluptuous_Vivian_ToD = GetServerVariable("[POP]Voluptuous_Vivian");

        -- Check if Voluptuous Vivian window is open, and there is not an Voluptuous Vivian popped already(ACTION_NONE = 0)
        if (Voluptuous_Vivian_ToD <= os.time(t) and GetMobAction(Voluptuous_Vivian) == 0) then

            -- printf("Voluptuous Vivian window open");
            -- Give Demonic Rose 10 percent chance to pop Voluptuous Vivian
            if (math.random(1,10) == 5) then
                -- printf("Voluptuous Vivian will pop");
                UpdateNMSpawnPoint(Voluptuous_Vivian);
                GetMobByID(Voluptuous_Vivian):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Voluptuous_Vivian", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;