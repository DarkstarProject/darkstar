-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Sulfur Scorpion
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,759,2);
end;