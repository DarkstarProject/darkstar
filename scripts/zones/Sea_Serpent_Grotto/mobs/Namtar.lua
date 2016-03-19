-----------------------------------
-- Area: Seas Serpent Grotto
--   NM: Ghast
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,805,2);
end;