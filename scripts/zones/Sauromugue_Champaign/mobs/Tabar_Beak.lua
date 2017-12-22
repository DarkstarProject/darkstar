-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Tabar Beak
-----------------------------------
require("scripts/zones/Sauromugue_Champaign/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,100,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DEADLY_DODO_PH,33,3600); -- 1 hour
end;
