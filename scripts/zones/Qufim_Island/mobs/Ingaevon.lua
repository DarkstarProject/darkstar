-----------------------------------
-- Area: Qufim Island
--  MOB: Ingaevon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,44,1);
    checkRegime(player,mob,45,2);
end;
