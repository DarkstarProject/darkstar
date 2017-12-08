-----------------------------------
-- Area: Batallia Downs
--  MOB: Stalking Sapling
-- Note: PH for Tottering Toby
-----------------------------------
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,72,1);
    checkRegime(player,mob,73,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,TOTTERING_TOBY_PH,20,3600); -- 1 hour
end;
