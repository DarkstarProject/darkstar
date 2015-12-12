-----------------------------------
-- Area: La Theine Plateau
--  MOB: Grass Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,6,1);
    checkRegime(ally,mob,71,2);
end;
