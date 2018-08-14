-----------------------------------
-- Area: La Theine Plateau
--  MOB: Coral Crab
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,70,2);
end;
