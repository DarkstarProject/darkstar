-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Processionaire
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,724,1);
end;