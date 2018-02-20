-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: BoWho Warmonger
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,1);
end;
