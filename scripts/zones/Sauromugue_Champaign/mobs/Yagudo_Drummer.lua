-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Yagudo Drummer
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,99,2);
end;
