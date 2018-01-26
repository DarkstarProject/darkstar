-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Yuhtunga Mandragora
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,124,1);
end;
