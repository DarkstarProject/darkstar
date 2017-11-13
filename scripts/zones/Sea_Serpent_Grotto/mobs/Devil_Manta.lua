-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Devil Manta
-- Note: Place holder Charybdis
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Sea_Serpent_Grotto/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,810,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Get Devil Manta ID and check if it is a PH of Charybdis
    local mobID = mob:getID()

    local nmID = Charybdis_PH[mobID]
    -- Check if Devil Manta is within the Charybdis_PH table
    if nmID ~= nil then
        -- printf("%u is a PH",mob);
        -- Get Charybdis's previous ToD
        local nm = GetMobByID(nmID)
        local ToD = nm:getLocalVar("ToD")

        -- Check if Charybdis window is open, and there is not a Charybdis popped already (or waiting to pop)
        if ToD <= os.time() and nm:isSpawned() == false and nm:getRespawnTime() == 0 then
            -- printf("Charybdis window open");
            -- Give Devil_Manta 10 percent chance to pop Charybdis
            if (math.random(1,10) == 5) then
                -- printf("Charybdis will pop");
                UpdateNMSpawnPoint(nmID)
                nm:setRespawnTime(GetMobRespawnTime(mobID))
                nm:addListener("DESPAWN", "CHARYBDIS_PH", function(mob)
                    -- Set Charybdis's ToD
                    mob:setLocalVar("ToD", os.time() + math.random(28800,43200))
                    DisallowRespawn(mob:getID(), true)

                    -- Set PH back to normal, then set to respawn spawn
                    local PH = mobID
                    DisallowRespawn(PH, false)
                    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH))
                    mob:removeListener("CHARYBDIS_PH")
                end)
                DisallowRespawn(mobID, true)
            end
        end
    end
end;