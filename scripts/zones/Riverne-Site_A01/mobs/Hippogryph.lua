-----------------------------------
-- Area: Riverne Site A01
--  MOB: Hippogryph
-- Note: PH for Heliodromos
-----------------------------------
require("scripts/zones/Riverne-Site_A01/MobIDs");
-----------------------------------

function disturbMob(mob)
    local offset = mob:getID() - HELIODROMOS_PH_OFFSET;
    if (offset >= 0 and offset <= 2) then
        SetServerVariable("Heliodromos_ToD", os.time() + math.random(43200, 54000)); -- 12 to 15 hours
    end
end

function onMobSpawn(mob)
    disturbMob(mob);
end;

function onMobEngaged(mob, target)
    disturbMob(mob);
end;

function onMobFight(mob, target)
    disturbMob(mob);
end;

function onMobRoam(mob)
    -- no PH has been disturbed for 12-15 hours
    if (os.time() > GetServerVariable("Heliodromos_ToD")) then
        local noHeliodromosSpawned = true;
        for i = HELIODROMOS_OFFSET, HELIODROMOS_OFFSET + 2 do
            if (GetMobByID(i):isSpawned()) then
                noHeliodromosSpawned = false;
            end
        end
        if (noHeliodromosSpawned) then
            -- despawn placeholders
            for i = HELIODROMOS_PH_OFFSET, HELIODROMOS_PH_OFFSET + 2 do
                DisallowRespawn(i, true);
                DespawnMob(i);
            end
            -- spawn heliodromos
            for i = HELIODROMOS_OFFSET, HELIODROMOS_OFFSET + 2 do
                SpawnMob(i);
            end
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;
