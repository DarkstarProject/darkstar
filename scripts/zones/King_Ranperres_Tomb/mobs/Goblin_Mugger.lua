-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Mugger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,631,2);
    checkGoVregime(ally,mob,635,1);
end;