-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Undead Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,804,2);
end;