-----------------------------------
-- Area: South Gustaberg
--  MOB: Land Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,80,2);
end;
