-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Cockatrice
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,772,1);
    checkGoVregime(ally,mob,773,2);
end;