-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Explosure
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,706,2);
end;