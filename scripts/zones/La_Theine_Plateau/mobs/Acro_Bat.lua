-----------------------------------
-- Area: La Theine Plateau
--  MOB: Acro Bat
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,71,1);
end;
