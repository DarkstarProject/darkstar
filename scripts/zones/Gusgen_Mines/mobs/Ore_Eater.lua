-----------------------------------
-- Area: Gusgen Mines
--  MOB: Ore Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,681,1);
end;