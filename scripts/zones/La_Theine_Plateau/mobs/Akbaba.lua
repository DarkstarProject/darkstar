-----------------------------------
-- Area: La Theine Plateau
--  MOB: Akbaba
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,69,2);
end;
