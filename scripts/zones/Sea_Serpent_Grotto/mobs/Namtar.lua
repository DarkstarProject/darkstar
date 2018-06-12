-----------------------------------
-- Area: Seas Serpent Grotto
--   NM: Ghast
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,805,2);
end;