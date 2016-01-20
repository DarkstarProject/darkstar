-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Rock Golem
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,118,1);
end;
