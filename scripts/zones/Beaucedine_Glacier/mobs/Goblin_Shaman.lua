-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Goblin Shaman
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,46,2);
    checkRegime(player,mob,49,1);
    checkRegime(player,mob,50,2);
end;
