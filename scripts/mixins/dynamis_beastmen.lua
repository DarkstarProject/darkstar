-- Dynamis procs mixin
-- Customization: dynamis_currency for the currency to drop

require("scripts/globals/mixins")
require("scripts/globals/dynamis")

g_mixins = g_mixins or {}

-- dynamis_currency values:
--  t.whiteshell: 1449
--  o. bronzepiece: 1452
--  1 byne bill: 1455

g_mixins.dynamis_beastmen = function(mob)
    local procjobs = {
        [dsp.jobs.WAR] = "ws",
        [dsp.jobs.MNK] = "ja",
        [dsp.jobs.WHM] = "ma",
        [dsp.jobs.BLM] = "ma",
        [dsp.jobs.RDM] = "ma",
        [dsp.jobs.THF] = "ja",
        [dsp.jobs.PLD] = "ws",
        [dsp.jobs.DRK] = "ws",
        [dsp.jobs.BST] = "ja",
        [dsp.jobs.BRD] = "ma",
        [dsp.jobs.RNG] = "ja",
        [dsp.jobs.SAM] = "ws",
        [dsp.jobs.NIN] = "ja",
        [dsp.jobs.DRG] = "ws",
        [dsp.jobs.SMN] = "ma"
    }
    mob:addListener("MAGIC_TAKE", "DYNAMIS_MAGIC_PROC_CHECK", function(mob, caster, spell, action)
        if procjobs[mob:getMainJob()] == "ma" and math.random(0,99) < 8 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "DYNAMIS_WS_PROC_CHECK", function(mob, user, wsid)
        if procjobs[mob:getMainJob()] == "ws" and math.random(0,99) < 25 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("ABILITY_TAKE", "DYNAMIS_ABILITY_PROC_CHECK", function(mob, user, ability, action)
        if procjobs[mob:getMainJob()] == "ja" and math.random(0,99) < 20 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("DEATH", "DYNAMIS_ITEM_DISTRIBUTION", function(mob, killer)
        if killer then
            -- just guessing on this until I can find better data (10% on low level mobs, 15% on higher)
            local chance = 100
            if mob:getMainLvl() > 90 then
                chance = 150
            end
            if mob:getLocalVar("dynamis_proc") >= 3 then killer:addTreasure(mob:getLocalVar("dynamis_currency"), mob) end
            if mob:getLocalVar("dynamis_proc") >= 2 then killer:addTreasure(mob:getLocalVar("dynamis_currency"), mob, chance) end
            if mob:getLocalVar("dynamis_proc") >= 1 then killer:addTreasure(mob:getLocalVar("dynamis_currency"), mob, chance) end
            killer:addTreasure(mob:getLocalVar("dynamis_currency"), mob, chance)
        end
    end)
end

return g_mixins.dynamis_beastmen
