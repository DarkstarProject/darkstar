-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Sleet Gigas
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,50,1);
end;
