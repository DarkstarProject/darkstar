-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Warrior
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,671,1);
    checkGoVregime(ally,mob,675,2);
    checkGoVregime(ally,mob,676,1);
end;