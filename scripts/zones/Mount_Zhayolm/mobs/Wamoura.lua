-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Wamoura
-----------------------------------
require("scripts/zones/Mount_Zhayolm/MobIDs");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,IGNAMOTH_PH,10,7200); -- 2 hours
end;
