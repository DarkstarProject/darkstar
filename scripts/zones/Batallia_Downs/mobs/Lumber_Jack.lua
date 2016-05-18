-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Lumber Jack
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 600);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Weeping Willow's respawn time (21-24 hours)
    GetMobByID(mob:getID() -6):setRespawnTime(math.random(75600,86400));

end;
