-----------------------------------
-- Area: Cape Teriggan
--  MOB: Beach Bunny
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,104,1);
end;
