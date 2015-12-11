-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,84,3);
end;
