-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,56,2);
end;
