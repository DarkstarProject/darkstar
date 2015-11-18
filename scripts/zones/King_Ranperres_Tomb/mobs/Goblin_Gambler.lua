-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Gambler
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
    checkGoVregime(killer,mob,635,3);
end;