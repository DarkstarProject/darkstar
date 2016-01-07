-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Marsh Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,24,1);
    checkRegime(ally,mob,60,2);
end;
