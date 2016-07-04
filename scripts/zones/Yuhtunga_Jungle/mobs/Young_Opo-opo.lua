-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Young Opo-opo
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,126,1);
    checkRegime(player,mob,128,1);
end;
