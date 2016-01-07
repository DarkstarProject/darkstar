-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Grotto Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,808,2);
end;