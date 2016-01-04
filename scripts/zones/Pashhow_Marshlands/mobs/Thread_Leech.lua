-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,22,1);
    checkRegime(ally,mob,23,2);
end;
