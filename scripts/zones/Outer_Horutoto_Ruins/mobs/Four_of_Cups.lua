-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four Of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,663,1);
end;