-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,668,1);
end;