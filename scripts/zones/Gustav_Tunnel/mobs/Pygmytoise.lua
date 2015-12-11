-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Pygmytoise
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,770,2);
end;