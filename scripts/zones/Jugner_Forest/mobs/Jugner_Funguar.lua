-----------------------------------
-- Area: Jugner Forest
--  MOB: Jugner Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,13,1);
    checkRegime(ally,mob,14,1);
end;
