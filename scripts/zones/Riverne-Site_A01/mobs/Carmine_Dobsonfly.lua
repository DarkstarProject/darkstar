-----------------------------------
-- Area: Riverne Site A01
--  MOB: Carmine Dobsonfly
-----------------------------------
require("scripts/zones/Riverne-Site_A01/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, CARMINE_DOBSONFLY_OFFSET);
    mob:SetMagicCastingEnabled(false); -- does not cast spells while idle
end;

function onMobEngaged(mob,target)
    mob:SetMagicCastingEnabled(true);
end;

function onMobDisengage(mob)
    mob:SetMagicCastingEnabled(false);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- each dead dobsonfly should stay despawned until all 10 are killed. then they respawn as a group.

    local allFliesDead = true;
    for i = CARMINE_DOBSONFLY_OFFSET, CARMINE_DOBSONFLY_OFFSET + 9 do
        if (GetMobByID(i):isAlive()) then
            allFliesDead = false;
        end
    end
    
    if (allFliesDead) then
        local respawnTime = math.random(75600,86400);
        for i = CARMINE_DOBSONFLY_OFFSET, CARMINE_DOBSONFLY_OFFSET + 9 do
            DisallowRespawn(i, false);
            GetMobByID(i):setRespawnTime(respawnTime);
        end
    else
        DisallowRespawn(mobID, true);
    end
end;