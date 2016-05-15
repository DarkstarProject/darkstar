-----------------------------------
-- Area: Fei'Yin
--  MOB: Specter
-----------------------------------

require("scripts/zones/FeiYin/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,712,1);

    -- Get Specter ID and check if it is a PH of any Shadow NM
    local mobID = mob:getID();

    -- Check if Specter is within the Northern_Shadow_PH table
    if (Northern_Shadow_PH[mobID] ~= nil) then
        -- Get NM's previous ToD
        local Northern_Shadow_ToD = GetServerVariable("[POP]Northern_Shadow");

        -- Check if NM's window is open, and there is not an Northern Shadow popped already(ACTION_NONE = 0)
        if (Northern_Shadow_ToD <= os.time(t) and GetMobAction(Northern_Shadow) == 0) then

            -- Give Specter 5 percent chance to pop a NM
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Northern_Shadow);
                GetMobByID(Northern_Shadow):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Northern_Shadow", mobID);
                DeterMob(mobID, true);
            end
        end
    end

    -- Check if Specter is within the Eastern_Shadow_PH table
    if (Eastern_Shadow_PH[mobID] ~= nil) then
        -- Get NM's previous ToD
        local Eastern_Shadow_ToD = GetServerVariable("[POP]Eastern_Shadow");

        -- Check if NM's window is open, and there is not an Eastern Shadow popped already(ACTION_NONE = 0)
        if (Eastern_Shadow_ToD <= os.time(t) and GetMobAction(Eastern_Shadow) == 0) then

            -- Give Specter 5 percent chance to pop a NM
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Eastern_Shadow);
                GetMobByID(Eastern_Shadow):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Eastern_Shadow", mobID);
                DeterMob(mobID, true);
            end
        end
    end

    -- Check if Specter is within the Southern_Shadow_PH table
    if (Southern_Shadow_PH[mobID] ~= nil) then
        -- Get NM's previous ToD
        local Southern_Shadow_ToD = GetServerVariable("[POP]Southern_Shadow");

        -- Check if NM's window is open, and there is not an Southern Shadow popped already(ACTION_NONE = 0)
        if (Southern_Shadow_ToD <= os.time(t) and GetMobAction(Southern_Shadow) == 0) then

            -- Give Specter 5 percent chance to pop a NM
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Southern_Shadow);
                GetMobByID(Southern_Shadow):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Southern_Shadow", mobID);
                DeterMob(mobID, true);
            end
        end
    end

    -- Check if Specter is within the Western_Shadow_PH table
    if (Western_Shadow_PH[mobID] ~= nil) then
        -- Get NM's previous ToD
        local Western_Shadow_ToD = GetServerVariable("[POP]Western_Shadow");

        -- Check if NM's window is open, and there is not an Western Shadow popped already(ACTION_NONE = 0)
        if (Western_Shadow_ToD <= os.time(t) and GetMobAction(Western_Shadow) == 0) then

            -- Give Specter 5 percent chance to pop a NM
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Western_Shadow);
                GetMobByID(Western_Shadow):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Western_Shadow", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
