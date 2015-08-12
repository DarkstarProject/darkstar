-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Tinkerer
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
    checkGoVregime(killer,mob,633,2);
end;