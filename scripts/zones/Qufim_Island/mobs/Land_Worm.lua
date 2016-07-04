-----------------------------------
-- Area: Qufim Island
--  MOB: Land Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,41,2);
end;
