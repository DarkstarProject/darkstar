-- for mobs with job-specific special ability

require("scripts/globals/mixins");
require("scripts/globals/status");

g_mixins = g_mixins or {};

g_mixins.job_special = function(mob)

    mob:addListener("SPAWN", "JOB_SPECIAL_SPAWN", function(mob)
        mob:setLocalVar("useSpecAtHpMin", 40);
        mob:setLocalVar("useSpecAtHpMax", 60);
        mob:setLocalVar("useMainSpecAtHPP", math.random(40,60));
    end);
    
    mob:addListener("COMBAT_TICK", "JOB_SPECIAL_CTICK", function(mob)
        local defaultAbility = {
            [dsp.job.WAR] = jobSpec.MIGHTY_STRIKES,
            [dsp.job.MNK] = jobSpec.HUNDRED_FISTS,
            [dsp.job.WHM] = jobSpec.BENEDICTION,
            [dsp.job.BLM] = jobSpec.MANAFONT,
            [dsp.job.RDM] = jobSpec.CHAINSPELL,
            [dsp.job.THF] = jobSpec.PERFECT_DODGE,
            [dsp.job.PLD] = jobSpec.INVINCIBLE,
            [dsp.job.DRK] = jobSpec.BLOOD_WEAPON,
            [dsp.job.BST] = jobSpec.FAMILIAR,
            [dsp.job.BRD] = jobSpec.SOUL_VOICE,
            [dsp.job.SAM] = jobSpec.MEIKYO_SHISUI,
            [dsp.job.NIN] = jobSpec.MIJIN_GAKURE,
            [dsp.job.DRG] = jobSpec.CALL_WYVERN,
            [dsp.job.SMN] = jobSpec.ASTRAL_FLOW,
        };

        if (mob:getLocalVar("usedMainSpec") == 0 and mob:getHPP() < mob:getLocalVar("useMainSpecAtHPP")) then
            local default = defaultAbility[mob:getMainJob()];
            local spec = mob:getLocalVar("mainSpec");
            if (spec > 0) then
                mob:useMobAbility(spec);
            elseif (default ~= nil) then
                mob:useMobAbility(default);
            end
            mob:setLocalVar("usedMainSpec", 1);
        end

        if (mob:getLocalVar("usedSubSpec") == 0 and mob:getHPP() < mob:getLocalVar("useSubSpecAtHPP")) then
            local default = defaultAbility[mob:getSubJob()];
            local spec = mob:getLocalVar("subSpec");
            if (spec > 0) then
                mob:useMobAbility(spec);
            elseif (default ~= nil) then
                mob:useMobAbility(default);
            end
            mob:setLocalVar("usedSubSpec", 1);
        end

    end);

    mob:addListener("DISENGAGE", "JOB_SPECIAL_DISENGAGE", function(mob, target)
        mob:setLocalVar("usedMainSpec", 0);
        mob:setLocalVar("usedSubSpec", 0);

        local hpMin =  mob:getLocalVar("useSpecAtHpMin");
        local hpMax =  mob:getLocalVar("useSpecAtHpMax");
  
        mob:setLocalVar("useMainSpecAtHPP", math.random(hpMin,hpMax));
        if (mob:getLocalVar("useSubSpecAtHPP") > 0) then
            mob:setLocalVar("useSubSpecAtHPP", math.random(hpMin,hpMax));
        end
    end);
    
end

return g_mixins.job_special;
