-----------------------------------
-- Area: Yhoator Jungle
--  NM:  Hoar-knuckled Rimberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,133,1);
end;
