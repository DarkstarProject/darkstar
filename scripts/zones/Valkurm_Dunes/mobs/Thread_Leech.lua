-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Thread Leech
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,57,1);
end;
