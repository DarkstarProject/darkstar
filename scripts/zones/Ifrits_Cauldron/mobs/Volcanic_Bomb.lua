-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcanic Bomb
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,760,2);
    checkGoVregime(ally,mob,761,2);
    checkGoVregime(ally,mob,762,2);
end;