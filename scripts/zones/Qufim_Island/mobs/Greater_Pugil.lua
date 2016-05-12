-----------------------------------
-- Area: Qufim Island
--  MOB: Greater Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,43,1);
    checkRegime(player,mob,44,2);
    checkRegime(player,mob,45,3);
end;
