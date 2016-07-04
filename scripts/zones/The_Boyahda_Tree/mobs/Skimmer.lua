-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Skimmer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,723,1);
end;