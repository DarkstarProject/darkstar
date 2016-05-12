-----------------------------------
-- Area: Riverne - Site B01
--  MOB: Nimbus Hippogryph
-- Note: Place holder Imdugud
-----------------------------------

require("scripts/zones/Riverne-Site_B01/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Get Nimbus Hippogryph ID and check if it is a PH of Imdugud
    local mobID = mob:getID();

    -- Check if Nimbus Hippogryph is within the Imdugud_PH table
    if (Imdugud_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Imdugud previous ToD
        local Imdugud_ToD = GetServerVariable("[POP]Imdugud");

        -- Check if Imdugud window is open, and there is not an Imdugud popped already(ACTION_NONE = 0)
        if (Imdugud_ToD <= os.time(t) and GetMobAction(Imdugud) == 0) then

            -- printf("Imdugud window open");
            -- Give Nimbus Hippogryph 10 percent chance to pop Imdugud
            if (math.random(1,10) == 5) then
                -- printf("Imdugud will pop");
                UpdateNMSpawnPoint(Imdugud);
                GetMobByID(Imdugud):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Imdugud", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
