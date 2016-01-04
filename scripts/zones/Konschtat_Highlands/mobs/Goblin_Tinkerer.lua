-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Tinkerer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,84,2);
end;
