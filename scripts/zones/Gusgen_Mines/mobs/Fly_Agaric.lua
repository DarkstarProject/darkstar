-----------------------------------
-- Area: Gusgen Mines
--  MOB: Fly Agaric
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,680,1);
end;