-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Meww the Turtlerider
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,127,1);
end;
