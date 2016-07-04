-----------------------------------
-- Area: Outer Horutoto
--  MOB: Fuligo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,669,2);
    checkGoVregime(player,mob,670,2);
end;