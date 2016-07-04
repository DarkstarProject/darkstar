-----------------------------------
-- Area: Batallia Downs
--  MOB: Ba
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,15,2);
    checkRegime(player,mob,73,2);
end;
