-----------------------------------
-- Area: Batallia Downs (105)
--   NM: Lumber Jack
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 600);
end;

function onAdditionalEffect(mob, target, damage)
    if mob:hasStatusEffect(dsp.effect.ENSTONE) then
        return 0, 0, 0
    else
        return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.STUN)
    end
end

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Weeping Willow's respawn time (21-24 hours)
    GetMobByID(mob:getID() -6):setRespawnTime(math.random(75600,86400));
end;
