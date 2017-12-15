-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Skirling Liger
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobEngaged(mob,target)
    mob:setMod(MOD_REGAIN, 50);
end;

function onMobDisengage(mob)
    mob:setMod(MOD_REGAIN,0);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
