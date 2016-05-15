-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Wild Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,96,2);
end;
