-----------------------------------
-- Area: Cape Teriggan
--  MOB: Sand Lizard
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,104,2);
end;
