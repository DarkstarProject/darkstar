-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Mindgazer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,811,1);
end;