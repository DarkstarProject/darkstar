-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Bigclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,807,2);
end;