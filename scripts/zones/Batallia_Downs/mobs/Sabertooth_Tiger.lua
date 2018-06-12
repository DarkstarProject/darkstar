-----------------------------------
-- Area: Batallia Downs
--  MOB: Sabertooth Tiger
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,74,1);
    checkRegime(player,mob,75,1);
end;
