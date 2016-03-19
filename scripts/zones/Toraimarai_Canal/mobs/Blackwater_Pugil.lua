-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Blackwater Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,624,1);
end;
