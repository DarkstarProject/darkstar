-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Nekros Hound
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,677,2);
    checkGoVregime(ally,mob,678,2);
end;