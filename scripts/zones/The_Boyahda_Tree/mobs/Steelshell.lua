-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Steelshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,723,2);
end;