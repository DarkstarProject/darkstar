-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Tinkerer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,84,2);
end;
