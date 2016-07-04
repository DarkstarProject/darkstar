-----------------------------------
-- Area: Outer Horutoto
--  MOB: Fetor Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,669,1);
end;