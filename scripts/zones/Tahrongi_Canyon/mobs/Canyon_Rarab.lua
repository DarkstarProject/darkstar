-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Canyon Rarab
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,94,1);
end;
