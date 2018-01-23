-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Strolling Sapling
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,30,1);
end;
