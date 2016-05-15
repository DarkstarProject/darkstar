-----------------------------------
-- Area: Cape Teriggan
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,105,1);
    checkRegime(player,mob,106,1);
end;
