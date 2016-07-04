-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Wingrats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,703,1);
end;