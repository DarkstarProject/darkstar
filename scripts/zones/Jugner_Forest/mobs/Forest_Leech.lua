-----------------------------------
-- Area: Jugner Forest
--  MOB: Forest Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,11,1);
    checkRegime(ally,mob,12,2);
end;
