-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Diving Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,40,2);
end;
