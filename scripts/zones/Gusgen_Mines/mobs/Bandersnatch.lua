-----------------------------------
-- Area: Gusgen Mines
--  MOB: Bandersnatch
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,681,2);
end;