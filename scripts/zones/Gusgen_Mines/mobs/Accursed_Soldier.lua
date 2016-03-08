-----------------------------------
-- Area: Gusgen Mines
--  MOB: Accursed Soldier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,679,1);
    checkGoVregime(ally,mob,680,2);
    checkGoVregime(ally,mob,685,1);
end;