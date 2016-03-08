-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Mystic Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,743,1);
    checkGoVregime(ally,mob,744,1);
end;