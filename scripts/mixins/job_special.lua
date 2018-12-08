--[[
Mobs with job-specific special ability.  Controlled by following vars that can be set onMobSpawn:

localVar            default     description
--------            -------     -----------
mainSpec            by job      Which special will mob use. default to mob's main job. Must be explicitly set for rangers.
useMainSpecAtHPP    40 to 60    HP percent at which main special will be used.
waitJobSpec         0           Mob must wait this many seconds before using its special, regardless of HPP.
mainQuote           0           special message displayed when mob uses main special.
subQuote            0           special message displayed when mob uses sub special.
--]]

require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}

g_mixins.job_special = function(mob)

    mob:addListener("SPAWN", "JOB_SPECIAL_SPAWN", function(mob)
        mob:setLocalVar("useSpecAtHpMin", 40)
        mob:setLocalVar("useSpecAtHpMax", 60)
        mob:setLocalVar("useMainSpecAtHPP", math.random(40,60))
        mob:setLocalVar("waitJobSpec", 2)
    end)

    mob:addListener("COMBAT_TICK", "JOB_SPECIAL_CTICK", function(mob)
        local defaultAbility = {
            [dsp.job.WAR] = dsp.jsa.MIGHTY_STRIKES,
            [dsp.job.MNK] = dsp.jsa.HUNDRED_FISTS,
            [dsp.job.WHM] = dsp.jsa.BENEDICTION,
            [dsp.job.BLM] = dsp.jsa.MANAFONT,
            [dsp.job.RDM] = dsp.jsa.CHAINSPELL,
            [dsp.job.THF] = dsp.jsa.PERFECT_DODGE,
            [dsp.job.PLD] = dsp.jsa.INVINCIBLE,
            [dsp.job.DRK] = dsp.jsa.BLOOD_WEAPON,
            [dsp.job.BST] = dsp.jsa.FAMILIAR,
            [dsp.job.BRD] = dsp.jsa.SOUL_VOICE,
            [dsp.job.SAM] = dsp.jsa.MEIKYO_SHISUI,
            [dsp.job.NIN] = dsp.jsa.MIJIN_GAKURE,
            [dsp.job.DRG] = dsp.jsa.CALL_WYVERN,
            [dsp.job.SMN] = dsp.jsa.ASTRAL_FLOW,
            [dsp.job.BLU] = dsp.jsa.AZURE_LORE,
        }

        if mob:getLocalVar("usedMainSpec") == 0 and mob:getHPP() < mob:getLocalVar("useMainSpecAtHPP") and mob:getBattleTime() >= mob:getLocalVar("waitJobSpec") then
            local default = defaultAbility[mob:getMainJob()]
            local spec = mob:getLocalVar("mainSpec")
            local quote = mob:getLocalVar("mainQuote")
            if quote > 0 then
                mob:messageText(mob, quote)
            end
            if spec > 0 then
                mob:useMobAbility(spec)
            elseif default ~= nil then
                mob:useMobAbility(default)
            end
            mob:setLocalVar("usedMainSpec", 1)
        end

        if mob:getLocalVar("usedSubSpec") == 0 and mob:getHPP() < mob:getLocalVar("useSubSpecAtHPP") and mob:getBattleTime() >= mob:getLocalVar("waitJobSpec") then
            local default = defaultAbility[mob:getSubJob()]
            local spec = mob:getLocalVar("subSpec")
            local quote = mob:getLocalVar("subQuote")
            if quote > 0 then
                mob:messageText(mob, quote)
            end
            if spec > 0 then
                mob:useMobAbility(spec)
            elseif default ~= nil then
                mob:useMobAbility(default)
            end
            mob:setLocalVar("usedSubSpec", 1)
        end
    end)

    mob:addListener("DISENGAGE", "JOB_SPECIAL_DISENGAGE", function(mob, target)
        mob:setLocalVar("usedMainSpec", 0)
        mob:setLocalVar("usedSubSpec", 0)

        local hpMin =  mob:getLocalVar("useSpecAtHpMin")
        local hpMax =  mob:getLocalVar("useSpecAtHpMax")

        mob:setLocalVar("useMainSpecAtHPP", math.random(hpMin,hpMax))
        if mob:getLocalVar("useSubSpecAtHPP") > 0 then
            mob:setLocalVar("useSubSpecAtHPP", math.random(hpMin,hpMax))
        end
    end)

end

return g_mixins.job_special