-----------------------------------
-- Area: La Theine Plateau
--  MOB: Poison Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,71,2);
end;
