-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Desert Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,111,3);
end;
