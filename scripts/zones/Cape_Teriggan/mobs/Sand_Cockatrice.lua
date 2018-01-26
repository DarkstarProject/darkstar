-----------------------------------
-- Area: Cape Teriggan
--  MOB: Sand Cockatrice
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,107,2);
    checkRegime(player,mob,108,1);
end;
