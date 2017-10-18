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
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Get Rock Lizard ID and check if it is a PH of LL
    local mobID = mob:getID()

    local nmID = Leaping_Lizzy_PH[mobID]
    -- Check if Rock Lizard is within the Leaping_Lizzy_PH table
    if nmID ~= nil then
        -- printf("%u is a PH",mob);
        -- Get LL's previous ToD
        local nm = GetMobByID(nmID)
        local ToD = nm:getLocalVar("ToD")

        -- Check if LL window is open, and there is not an LL popped already (or waiting to pop)
        if ToD <= os.time() and nm:isSpawned() == false and nm:getRespawnTime() == 0 then
            -- printf("LL window open");
            -- Give Rock_Lizard 5 percent chance to pop LL
            if (math.random(1,20) == 5) then
                -- printf("LL will pop");
                UpdateNMSpawnPoint(nmID)
                nm:setRespawnTime(GetMobRespawnTime(mobID))
                nm:addListener("DESPAWN", "LL_PH", function(mob)
                    -- Set LL's ToD
                    mob:setLocalVar("ToD", os.time() + 3600)
                    DisallowRespawn(mob:getID(), true)

                    -- Set PH back to normal, then set to respawn spawn
                    local PH = mobID
                    DisallowRespawn(PH, false)
                    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH))
                    mob:removeListener("LL_PH")
                end)
                DisallowRespawn(mobID, true)
            end
        end
    end
end;
