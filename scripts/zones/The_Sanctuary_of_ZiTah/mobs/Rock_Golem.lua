-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Rock Golem
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,118,1);
end;
