-----------------------------------
-- Area: Gusgen Mines
--  MOB: Rockmill
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,685,2);
end;