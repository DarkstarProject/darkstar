-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Ivory Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,124,2);
end;
