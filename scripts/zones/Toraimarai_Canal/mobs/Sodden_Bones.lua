-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Sodden Bones
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,623,2);
end;
