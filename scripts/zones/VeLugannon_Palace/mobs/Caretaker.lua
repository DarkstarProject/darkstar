-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Caretaker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,743,1);
    checkGoVregime(player,mob,746,1);
end;