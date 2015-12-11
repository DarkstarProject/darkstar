-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Giant Bee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,90,1);
end;
