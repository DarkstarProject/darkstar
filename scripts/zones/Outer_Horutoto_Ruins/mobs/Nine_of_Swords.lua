-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,668,3);
end;