-----------------------------------
-- Area: Qufim Island
--  MOB: Seeker Bats
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,42,2);
end;
