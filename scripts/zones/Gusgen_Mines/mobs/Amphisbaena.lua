-----------------------------------
-- Area: Gusgen Mines
--  MOB: Amphisbaena
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,682,2);
end;