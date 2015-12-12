-----------------------------------
-- Area: Gusgen Mines
--  MOB: Gallinipper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,684,2);
end;