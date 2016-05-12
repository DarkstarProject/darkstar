-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,809,2);
end;