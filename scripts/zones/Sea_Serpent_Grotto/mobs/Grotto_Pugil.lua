-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Grotto Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,808,2);
end;