-----------------------------------
-- Area: Batallia Downs
--  MOB: Orcish Serjeant
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,74,3);
end;
