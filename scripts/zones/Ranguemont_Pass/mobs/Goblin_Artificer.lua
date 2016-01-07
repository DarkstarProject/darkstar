-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Artificer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,609,2);
end;
