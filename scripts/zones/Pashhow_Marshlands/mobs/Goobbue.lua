-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Goobbue
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,60,3);
end;
