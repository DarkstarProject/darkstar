-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Ghast
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,805,2);
end;