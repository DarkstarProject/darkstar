-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Tsaagan
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,39,1);
end;
