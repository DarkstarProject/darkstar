-----------------------------------
-- Area: Quicksand Caves
--  MOB: Girtab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,818,1);
end;