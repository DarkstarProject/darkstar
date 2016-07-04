-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,809,1);
    checkGoVregime(player,mob,810,1);
end;