-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,84,3);
end;
