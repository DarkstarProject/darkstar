-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Hellbound Warrior
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,671,1);
    checkGoVregime(player,mob,675,2);
    checkGoVregime(player,mob,677,1);
end;