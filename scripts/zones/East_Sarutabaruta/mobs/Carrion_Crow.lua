-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Carrion Crow
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,93,1);
end;
