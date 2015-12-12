-----------------------------------
-- Area: Gusgen Mines
--  MOB: Myconid
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,683,2);
end;