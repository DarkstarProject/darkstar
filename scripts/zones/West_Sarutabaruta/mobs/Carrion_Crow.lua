-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Carrion Crow
-- Note: PH for Nunyenunc
-----------------------------------
require("scripts/zones/West_Sarutabaruta/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,28,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,NUNYENUNC_PH,10,math.random(7200,10800)); -- 2 to 3 hours
end;
