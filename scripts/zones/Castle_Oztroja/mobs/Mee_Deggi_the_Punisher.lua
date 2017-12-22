-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Mee_Deggi_the_Punisher
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 5) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2238,14986,1000); -- Ochimusha Kote
        SetDropRate(2238,16703,0);
    else
        SetDropRate(2238,14986,0);
        SetDropRate(2238,16703,1000); -- Impact Knuckles
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
