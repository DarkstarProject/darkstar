-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcanic Gas
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,755,2);
    checkGoVregime(ally,mob,756,2);
    checkGoVregime(ally,mob,757,2);
    checkGoVregime(ally,mob,758,2);
    checkGoVregime(ally,mob,759,1);
end;