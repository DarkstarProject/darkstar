-----------------------------------
-- Area: West Ronfaure
--  MOB: Orcish Grappler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,4,1);
end;
