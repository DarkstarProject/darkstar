-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Pevv the Riverleaper
-- BCNM: Amphibian Assault
-----------------------------------
require("scripts/zones/Sacrificial Chamber/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
    -- Spawn the pets if they are despawned
    -- TODO: summon animations?
    if (GetMobAction(wyvernA) == 0) then
        GetMobByID(wyvernA):SpawnMob(wyvernA, 300):updateEnmity(target);
    elseif (GetMobAction(wyvernB) == 0) then
        GetMobByID(wyvernB):SpawnMob(wyvernB, 300):updateEnmity(target);
    elseif (GetMobAction(wyvernC) == 0) then
        GetMobByID(wyvernC):SpawnMob(wyvernC, 300):updateEnmity(target);
    end

    -- Ensure all spawned pets are doing stuff..
    for pets = wyvernA, wyvernC do
        if (GetMobAction(pets) == 16) then
            -- Send pet after current target..
            GetMobByID(pets):updateEnmity(target);
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn( mob )
    -- Despawn pets.
    DespawnMob(wyvernA);
    DespawnMob(wyvernB);
    DespawnMob(wyvernC);
end
