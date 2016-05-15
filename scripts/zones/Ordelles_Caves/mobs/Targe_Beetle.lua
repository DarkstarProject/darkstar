-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Targe Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,661,2);
end;