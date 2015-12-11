-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Pygmaioi
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,94,2);
    checkRegime(ally,mob,95,1);
end;
