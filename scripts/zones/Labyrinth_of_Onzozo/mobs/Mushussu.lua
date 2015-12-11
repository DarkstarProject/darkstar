-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Mushussu
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,773,1);
end;