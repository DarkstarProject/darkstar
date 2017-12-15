-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Death Jacket
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,125,1);
end;
