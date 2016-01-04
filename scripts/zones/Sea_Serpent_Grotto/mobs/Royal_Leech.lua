-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Royal Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,804,1);
end;