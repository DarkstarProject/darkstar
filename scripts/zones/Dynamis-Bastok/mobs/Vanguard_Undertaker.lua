-----------------------------------
-- Area: Dynamis Bastok
--  NPC: SMN Vanguard Undertaker + Vanguard's Avatar
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