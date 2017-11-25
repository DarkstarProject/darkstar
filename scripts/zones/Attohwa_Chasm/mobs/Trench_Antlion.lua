-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Trench Antlion
-- Note: PH for Ambusher Antlion
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
require("scripts/globals/mobs");

function onMobSpawn(mob)
end;

function onMobEngaged(mob, target)
end;

function onMobDisengage(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,AMBUSHER_ANTLION_PH,10,3600); -- 1 hour
end;
