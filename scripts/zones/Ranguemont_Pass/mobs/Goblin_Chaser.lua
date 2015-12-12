-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Chaser
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,608,2);
end;
