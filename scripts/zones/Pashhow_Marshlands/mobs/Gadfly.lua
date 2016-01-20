-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Gadfly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,21,1);
    checkRegime(ally,mob,22,2);
end;
