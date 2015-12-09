-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Gambler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,604,2);
    checkGoVregime(ally,mob,605,2);
end;
