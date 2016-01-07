-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Ambusher
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
    checkGoVregime(ally,mob,633,1);
end;