-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Sauromugue Skink
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,97,1);
    checkRegime(player,mob,99,1);
end;
