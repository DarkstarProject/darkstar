-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,703,2);
end;