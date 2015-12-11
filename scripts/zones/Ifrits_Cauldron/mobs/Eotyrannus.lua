-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Eotyrannus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,758,1);
end;