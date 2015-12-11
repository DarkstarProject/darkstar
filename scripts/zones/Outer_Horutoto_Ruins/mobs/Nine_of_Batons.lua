-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,668,2);
end;