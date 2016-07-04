-----------------------------------
-- Area: South Gustaberg
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,79,1);
end;
