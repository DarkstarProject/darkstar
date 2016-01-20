-----------------------------------
-- Area: Jugner Forest
--  MOB: Screamer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,58,2);
end;
