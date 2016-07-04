-----------------------------------
-- Area: Sauromugue Champaign
-- NM:   Climbpix Highrise
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,97,2);
    checkRegime(player,mob,98,2);
end;
