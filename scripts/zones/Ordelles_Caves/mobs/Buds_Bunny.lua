-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Buds Bunny
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,661,1);
end;