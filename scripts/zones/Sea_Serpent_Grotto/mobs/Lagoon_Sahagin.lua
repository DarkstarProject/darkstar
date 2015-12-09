-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Lagoon Sahagin
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,806,1);
    checkGoVregime(ally,mob,807,1);
    checkGoVregime(ally,mob,808,1);
end;