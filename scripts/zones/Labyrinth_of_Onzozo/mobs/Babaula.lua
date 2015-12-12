-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Babaula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,776,1);
end;