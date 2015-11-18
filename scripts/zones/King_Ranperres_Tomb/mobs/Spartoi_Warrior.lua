-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Spartoi Warrior
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
    checkGoVregime(killer,mob,637,1);
end;