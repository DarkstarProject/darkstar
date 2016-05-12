-----------------------------------
-- Area: RoMaeve
--  MOB: Darksteel Golem
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,122,2);
    checkRegime(player,mob,123,2);
end;
