-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Darter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,724,2);
end;