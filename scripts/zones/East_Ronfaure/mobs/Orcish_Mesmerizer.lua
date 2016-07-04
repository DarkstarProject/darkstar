-----------------------------------
-- Area: East Ronfaure
--  MOB: Orcish Mesmerizer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,67,1);
end;
