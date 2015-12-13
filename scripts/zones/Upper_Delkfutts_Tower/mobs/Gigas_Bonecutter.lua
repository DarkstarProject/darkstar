-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Gigas Bonecutter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,785,1);
end;