-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Lich
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,671,1);
    checkGoVregime(player,mob,674,1);
    checkGoVregime(player,mob,675,2);
end;