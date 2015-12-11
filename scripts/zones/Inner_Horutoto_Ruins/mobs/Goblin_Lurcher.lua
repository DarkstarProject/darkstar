-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Lurcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,654,1);
end;