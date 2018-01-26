-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Pygmaioi
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,94,2);
    checkRegime(player,mob,95,1);
end;
