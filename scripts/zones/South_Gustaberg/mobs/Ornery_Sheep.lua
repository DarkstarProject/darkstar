----------------------------------
-- Area: South Gustaberg
--  MOB: Ornery Sheep
-- Note: Place holder Carnero
-----------------------------------

require("scripts/zones/South_Gustaberg/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();
    if (Carnero_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Carnero");
        if (ToD <= os.time() and GetMobAction(Carnero) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Carnero);
                GetMobByID(Carnero):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Carnero", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;