-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Bronze Quadav
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,87,2);
end;
