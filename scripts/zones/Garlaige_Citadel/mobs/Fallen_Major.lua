-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Major
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,703,2);
end;