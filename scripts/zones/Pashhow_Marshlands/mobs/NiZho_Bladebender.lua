-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: NiZho Bladebender
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,60,1);
end;
