-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Hoodoo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,608,1);
end;
