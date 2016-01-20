-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Leecher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,605,1);
end;
