-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Vampire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,806,2);
end;