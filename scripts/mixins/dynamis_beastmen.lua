-- Dynamis procs mixin
-- Customization: dynamis_currency for the currency to drop

require("scripts/globals/mixins")
require("scripts/globals/dynamis")
require("scripts/globals/status")

g_mixins = g_mixins or {}

-- dynamis_currency values:
--  t.whiteshell: 1449
--  o. bronzepiece: 1452
--  1 byne bill: 1455
--  random: 0

g_mixins.dynamis_beastmen = function(mob)
    local procjobs = {
        [dsp.job.WAR] = "ws",
        [dsp.job.MNK] = "ja",
        [dsp.job.WHM] = "ma",
        [dsp.job.BLM] = "ma",
        [dsp.job.RDM] = "ma",
        [dsp.job.THF] = "ja",
        [dsp.job.PLD] = "ws",
        [dsp.job.DRK] = "ws",
        [dsp.job.BST] = "ja",
        [dsp.job.BRD] = "ma",
        [dsp.job.RNG] = "ja",
        [dsp.job.SAM] = "ws",
        [dsp.job.NIN] = "ja",
        [dsp.job.DRG] = "ws",
        [dsp.job.SMN] = "ma"
    }
    mob:addListener("MAGIC_TAKE", "DYNAMIS_MAGIC_PROC_CHECK", function(target, caster, spell)
        if procjobs[target:getMainJob()] == "ma" and math.random(0,99) < 8 and target:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(target, caster)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "DYNAMIS_WS_PROC_CHECK", function(target, user, wsid)
        if procjobs[target:getMainJob()] == "ws" and math.random(0,99) < 25 and target:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(target, user)
        end
    end)

    mob:addListener("ABILITY_TAKE", "DYNAMIS_ABILITY_PROC_CHECK", function(mob, user, ability, action)
        if procjobs[mob:getMainJob()] == "ja" and math.random(0,99) < 20 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("DEATH", "DYNAMIS_ITEM_DISTRIBUTION", function(mob, killer)
        if killer then
            local currency = mob:getLocalVar("dynamis_currency")
            if currency == 0 then
                cur_t = {1449, 1452, 1455}
                currency = cur_t[math.random(#cur_t)]
            end
            -- just guessing on this until I can find better data (10% on low level mobs, 15% on higher)
            local chance = 100
            if mob:getMainLvl() > 90 then
                chance = 150
            end
            if mob:getLocalVar("dynamis_proc") >= 4 then killer:addTreasure(currency+1, mob) end
            if mob:getLocalVar("dynamis_proc") >= 3 then killer:addTreasure(currency, mob) end
            if mob:getLocalVar("dynamis_proc") >= 2 then killer:addTreasure(currency, mob, chance) end
            if mob:getLocalVar("dynamis_proc") >= 1 then killer:addTreasure(currency, mob, chance) end
            killer:addTreasure(mob:getLocalVar("dynamis_currency"), mob, chance)
        end
    end)
end

return g_mixins.dynamis_beastmen
