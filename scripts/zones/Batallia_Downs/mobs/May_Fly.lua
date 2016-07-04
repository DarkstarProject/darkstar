-----------------------------------
-- Area: Batallia Downs
--  MOB: May Fly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,15,1);
    checkRegime(player,mob,72,2);
end;
