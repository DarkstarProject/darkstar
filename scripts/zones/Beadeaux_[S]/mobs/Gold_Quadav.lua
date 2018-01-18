-----------------------------------
-- Area: Beadeaux (S)
--  MOB: Gold Quadav
-- Note: PH for Da'Dha Hundredmask
-----------------------------------
require("scripts/zones/Beadeaux_[S]/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DA_DHA_HUNDREDMASK_PH,12,7200); -- 2 hours
end;
