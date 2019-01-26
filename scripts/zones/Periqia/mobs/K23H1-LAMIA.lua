-----------------------------------
-- Area: Periqia (Shades of Vengeance)
--  MOB: K23H1-LAMIA
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance();
    local progress = math.random(1,4);
    instance:setProgress(instance:getProgress() + progress);
end;
