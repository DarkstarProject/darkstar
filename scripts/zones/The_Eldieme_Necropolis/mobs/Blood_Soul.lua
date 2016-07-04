-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Blood Soul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,674,2);
end;