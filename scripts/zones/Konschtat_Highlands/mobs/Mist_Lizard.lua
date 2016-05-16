-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Mist Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,20,2);
    checkRegime(player,mob,82,2);
end;
