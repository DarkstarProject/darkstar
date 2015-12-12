-----------------------------------
-- Area: Quicksand Caves
--  MOB: Spelunking Sabotender
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,816,1);
end;