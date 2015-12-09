-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Goblin Mugger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,777,2);
end;