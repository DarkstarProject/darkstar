-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Thug
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,647,2);
end;