-----------------------------------
-- Area: Gusgen Mines
--  MOB: Madfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,686,2);
end;