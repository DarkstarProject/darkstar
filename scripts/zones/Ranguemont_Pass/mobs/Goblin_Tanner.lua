-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Tanner
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,609,1);
end;
