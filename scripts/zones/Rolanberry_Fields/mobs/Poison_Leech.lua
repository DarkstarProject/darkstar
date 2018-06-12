-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Poison Leech
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,85,2);
end;
