-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,671,1);
    checkGoVregime(player,mob,675,2);
    checkGoVregime(player,mob,676,2);
end;