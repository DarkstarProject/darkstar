-----------------------------------
-- Area: Gusgen Mines
--  MOB: Accursed Sorcerer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,679,1);
    checkGoVregime(ally,mob,680,2);
    checkGoVregime(ally,mob,686,1);
end;