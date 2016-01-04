-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Akbaba
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,31,1);
end;
