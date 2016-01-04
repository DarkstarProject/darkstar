-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,671,1);
    checkGoVregime(ally,mob,675,2);
    checkGoVregime(ally,mob,676,2);
end;