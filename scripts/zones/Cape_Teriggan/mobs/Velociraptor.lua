-----------------------------------
-- Area: Cape Teriggan
--  MOB: Velociraptor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,106,2);
    checkRegime(ally,mob,107,1);
end;
