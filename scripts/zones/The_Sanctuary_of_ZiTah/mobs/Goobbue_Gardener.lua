-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Goobbue Gardener
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,114,2);
end;
