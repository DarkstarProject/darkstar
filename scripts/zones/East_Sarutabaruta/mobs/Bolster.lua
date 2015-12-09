-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Bolster
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,92,2);
    checkRegime(ally,mob,93,2);
end;
