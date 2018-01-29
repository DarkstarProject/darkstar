-----------------------------------
-- Area: North Gustaberg
--  MOB: Ornery Sheep
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,59,2);
end;
