-----------------------------------
-- Area: Gusgen Mines
--  MOB: Wight
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,679,1);
    checkGoVregime(ally,mob,680,2);
    checkGoVregime(ally,mob,683,1);
end;