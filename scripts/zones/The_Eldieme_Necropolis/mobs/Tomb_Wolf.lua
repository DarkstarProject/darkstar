-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Wolf
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,675,1);
end;