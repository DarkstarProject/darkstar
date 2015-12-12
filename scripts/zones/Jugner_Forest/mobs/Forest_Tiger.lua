-----------------------------------
-- Area: Jugner Forest
--  MOB: Forest Tiger
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,14,2);
end;
