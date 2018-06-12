-----------------------------------
-- Area: Dynamis San d'Oria
--  NPC: Wyrmgnasher Bjakdek
-- Boss Trigger for Overlord's Tombstone
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    local bossTrigger = GetServerVariable("[DynaSandoria]Boss_Trigger");

    if (bossTrigger == 0 or bossTrigger == 2) then
        SetServerVariable("[DynaSandoria]Boss_Trigger",bossTrigger + 1);
        SpawnMob(17535004); -- 061
        SpawnMob(17535381); -- 141
        SpawnMob(17535382); -- 142
    end

    -- If 2 boss trigger is killed -> pop the boss
    if (GetServerVariable("[DynaSandoria]Boss_Trigger") == 3) then
        SpawnMob(17534977);
        SetServerVariable("[DynaSandoria]Boss_Trigger",4);
    end

end;