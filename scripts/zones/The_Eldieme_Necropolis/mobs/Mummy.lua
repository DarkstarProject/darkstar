-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Mummy
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,671,1);
    checkGoVregime(ally,mob,675,2);
end;