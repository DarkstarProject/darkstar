-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Lumber Jack
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 600);
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating the chance to stun before resistance applied (it's fairly low rate on retail).
    -- Does not proc if Jack's enstone is up.
    if (math.random(1,100) <= 75 or mob:hasStatusEffect(dsp.effect.ENSTONE)
    or applyResistanceAddEffect(mob, target, dsp.magic.ele.LIGHTNING, 0) <= 0.5) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(dsp.effect.STUN,5,0,duration);
        return dsp.subEffect.STUN,0,dsp.effect.STUN; -- Todo: confirm retail message. Unsure if says "is stunned" on proc.
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Weeping Willow's respawn time (21-24 hours)
    GetMobByID(mob:getID() -6):setRespawnTime(math.random(75600,86400));
end;
