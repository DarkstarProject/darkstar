-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Lumber Jack
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 600);
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating the chance to stun before resistance applied (it's fairly low rate on retail).
    -- Does not proc if Jack's enstone is up.
    if (math.random(1,100) <= 75 or mob:hasStatusEffect(dsp.effects.ENSTONE)
    or applyResistanceAddEffect(mob, target, ELE_LIGHTNING, 0) <= 0.5) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(dsp.effects.STUN,5,0,duration);
        return SUBEFFECT_STUN,0,EFFECT_STUN; -- Todo: confirm retail message. Unsure if says "is stunned" on proc.
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Weeping Willow's respawn time (21-24 hours)
    GetMobByID(mob:getID() -6):setRespawnTime(math.random(75600,86400));
end;
