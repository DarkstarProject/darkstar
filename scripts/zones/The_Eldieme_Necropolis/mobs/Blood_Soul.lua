-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Blood Soul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,674,2);
end;