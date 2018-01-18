-----------------------------------
-- Area: Cape Teriggan
--  MOB: Greater Manticore
-- Note: Place Holder for Frostmane
-----------------------------------
require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,108,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,FROSTMANE_PH,5,math.random(3600,21600)); -- 1 to 6 hours
end;
