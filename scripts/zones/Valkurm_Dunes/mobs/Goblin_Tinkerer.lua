-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Tinkerer
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,57,2);
end;
