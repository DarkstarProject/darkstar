-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Marid
-- Note: Place holder Mahishasura
-----------------------------------

require("scripts/zones/Bhaflau_Thickets/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Get Marid ID and check if it is a PH of Mahishasura
    local mobID = mob:getID();

    -- Check if Marid is within the Mahishasura_PH table
    if (Mahishasura_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Mahishasura's previous ToD
        local Mahishasura_ToD = GetServerVariable("[POP]Mahishasura");

        -- Check if Mahishasura window is open, and there is not an Mahishasura popped already(ACTION_NONE = 0)
        if (Mahishasura_ToD <= os.time(t) and GetMobAction(Mahishasura) == 0) then

            -- printf("Mahishasura window open");
            -- Give Marid 5 percent chance to pop Mahishasura
            if (math.random(1,20) == 5) then
                -- printf("Mahishasura will pop");
                UpdateNMSpawnPoint(Mahishasura);
                GetMobByID(Mahishasura):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Mahishasura", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
