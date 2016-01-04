-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Caretaker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,743,1);
    checkGoVregime(ally,mob,746,1);
end;