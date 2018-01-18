-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Quu_Domi_the_Gallant
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 7) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2916,15737,1000); -- Sarutobi Kyahan
        SetDropRate(2916,16820,0);
    else
        SetDropRate(2916,15737,0);
        SetDropRate(2916,16820,1000); -- Strider Sword
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
