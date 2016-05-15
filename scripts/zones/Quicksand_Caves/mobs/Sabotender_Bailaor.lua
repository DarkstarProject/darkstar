-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sabotender Bailaor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,816,1);
end;