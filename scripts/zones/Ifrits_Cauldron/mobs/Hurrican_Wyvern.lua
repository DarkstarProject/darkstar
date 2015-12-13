-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Hurricane Wyvern
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,762,1);
end;