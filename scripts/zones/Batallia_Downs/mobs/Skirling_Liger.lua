-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Skirling Liger
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMod(dsp.mod.REGAIN, 50);
end;

function onMobDisengage(mob)
    mob:setMod(dsp.mod.REGAIN,0);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
