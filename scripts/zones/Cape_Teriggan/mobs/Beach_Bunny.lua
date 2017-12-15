-----------------------------------
-- Area: Cape Teriggan
--  MOB: Beach Bunny
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,104,1);
end;
