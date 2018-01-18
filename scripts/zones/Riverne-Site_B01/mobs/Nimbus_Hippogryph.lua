-----------------------------------
-- Area: Riverne - Site B01
--  MOB: Nimbus Hippogryph
-- Note: Place holder Imdugud
-----------------------------------
require("scripts/zones/Riverne-Site_B01/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,IMDUGUD_PH,10,75600); -- 21 hours
end;
