-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Death Cap
-----------------------------------

require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,719,1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Get Death Cap ID and check if it is a PH of Ellyllon
    local mobID = mob:getID()

    local nmID = Ellyllon_PH[mobID]
    -- Check if Death Cap is within the Ellyllon_PH table
    if nmID ~= nil then
        -- printf("%u is a PH",mob);
        -- Get Ellyllon's previous ToD
        local nm = GetMobByID(nmID)
        local ToD = nm:getLocalVar("ToD")

        -- Check if Ellyllon window is open, and there is not an Ellyllon popped already (or waiting to pop)
        if ToD <= os.time() and nm:isSpawned() == false and nm:getRespawnTime() == 0 then
            -- printf("Ellyllon window open");
            -- Give Death Cap 10 percent chance to pop Ellyllon
            if (math.random(1,10) == 5) then
                -- printf("Ellyllon will pop");
                UpdateNMSpawnPoint(nmID)
                nm:setRespawnTime(GetMobRespawnTime(mobID))
                nm:addListener("DESPAWN", "ELLYLLON_PH", function(mob)
                    -- Set Ellyllon's ToD
                    mob:setLocalVar("ToD", os.time() + math.random(7200,10800))  -- 2 to 3 hrs
                    DisallowRespawn(mob:getID(), true)

                    -- Set PH back to normal, then set to respawn spawn
                    local PH = mobID
                    DisallowRespawn(PH, false)
                    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH))
                    mob:removeListener("ELLYLLON_PH")
                end)
                DisallowRespawn(mobID, true)
            end
        end
    end
end;