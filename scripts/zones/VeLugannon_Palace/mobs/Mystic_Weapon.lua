-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Mystic Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,743,1);
    checkGoVregime(player,mob,744,1);
end;