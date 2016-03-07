-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Drowned Bones
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,624,2);
end;
