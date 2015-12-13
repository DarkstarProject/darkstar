-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bumblebee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,61,2);
end;
