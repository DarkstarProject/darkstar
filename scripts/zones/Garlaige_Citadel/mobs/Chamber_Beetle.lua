-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Chamber Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,707,2);
end;