-----------------------------------
-- Area: Jugner Forest
--  MOB: Stag Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,12,1);
    checkRegime(ally,mob,13,2);
end;
