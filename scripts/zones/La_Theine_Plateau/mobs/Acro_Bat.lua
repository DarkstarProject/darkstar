-----------------------------------
-- Area: La Theine Plateau
--  MOB: Acro Bat
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,1);
end;
