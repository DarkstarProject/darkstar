-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Olden Treant
-- Note: Place holder Emergent Elm
-----------------------------------

require("scripts/zones/Bhaflau_Thickets/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Get Olden Treant ID and check if it is a PH of EE
    local mobID = mob:getID();

    -- Check if Olden Treant is within the Emergent_Elm_PH table
    if (Emergent_Elm_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get EE's previous ToD
        local EE_ToD = GetServerVariable("[POP]Emergent_Elm");

        -- Check if EE window is open, and there is not an EE popped already(ACTION_NONE = 0)
        if (EE_ToD <= os.time(t) and GetMobAction(Emergent_Elm) == 0) then

            -- printf("EE window open");
            -- Give Olden Treant 5 percent chance to pop EE
            if (math.random(1,20) == 5) then
                -- printf("EE will pop");
                UpdateNMSpawnPoint(Emergent_Elm);
                GetMobByID(Emergent_Elm):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Emergent_Elm", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
