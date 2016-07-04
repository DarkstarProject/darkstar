-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Wolf
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,675,1);
end;