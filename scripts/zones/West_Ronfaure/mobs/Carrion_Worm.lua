-----------------------------------
-- Area: West Ronfaure
--  MOB: Carrion Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,1,1);
end;
