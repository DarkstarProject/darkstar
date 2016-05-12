-----------------------------------
-- Area: South Gustaberg
--  MOB: Rock Lizard
-- Note: Place holder Leaping Lizzy
-----------------------------------

require("scripts/zones/South_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,80,1);

    -- Get Rock Lizard ID and check if it is a PH of LL
    local mobID = mob:getID();

    -- Check if Rock Lizard is within the Leaping_Lizzy_PH table
    if (Leaping_Lizzy_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mob);
        -- Get LL's previous ToD
        local LL_ToD = GetServerVariable("[POP]Leaping_Lizzy");

        -- Check if LL window is open, and there is not an LL popped already(ACTION_NONE = 0)
        if (LL_ToD <= os.time(t) and GetMobAction(Leaping_Lizzy) == 0) then

            -- printf("LL window open");
            -- Give Rock_Lizard 5 percent chance to pop LL
            if (math.random(1,20) == 5) then
                -- printf("LL will pop");
                UpdateNMSpawnPoint(Leaping_Lizzy);
                GetMobByID(Leaping_Lizzy):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Leaping_Lizzy", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
