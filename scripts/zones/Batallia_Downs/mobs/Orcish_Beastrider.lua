-----------------------------------
-- Area: Batallia Downs
--  MOB: Orcish Beastrider
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,74,3);
end;
