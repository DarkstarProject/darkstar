-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Tiny Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,26,1);
end;
