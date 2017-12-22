-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Moo_Ouzi_the_Swiftblade
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 14) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2343,16936,1000); -- Demonic Sword
        SetDropRate(2343,16935,0);
    else
        SetDropRate(2343,16936,0);
        SetDropRate(2343,16935,1000); -- Barbarians Sword
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
