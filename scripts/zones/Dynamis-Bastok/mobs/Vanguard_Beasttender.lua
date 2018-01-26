-----------------------------------
-- Area: Dynamis Bastok
--  NPC: Vanguard Beasttender + Vanguard's Scorpion
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DespawnMob(mob:getID() + 1);
end;