-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Copper Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,60,1);
end;
