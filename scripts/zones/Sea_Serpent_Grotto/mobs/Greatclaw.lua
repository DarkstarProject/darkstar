-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Greatclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,811,2);
end;