-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Old Opo-opo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,756,1);
end;