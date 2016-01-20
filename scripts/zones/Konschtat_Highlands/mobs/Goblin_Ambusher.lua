-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Ambusher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,84,1);
end;
