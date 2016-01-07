-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Enkidu
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,743,1);
    checkGoVregime(ally,mob,747,1);
end;