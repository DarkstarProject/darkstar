-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Bumblebee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,90,1);
end;
