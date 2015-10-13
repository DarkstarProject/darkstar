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

function onMobDeath(mob,killer)
    checkGoVregime(killer,mob,631,2);
    checkGoVregime(killer,mob,633,1);
end;