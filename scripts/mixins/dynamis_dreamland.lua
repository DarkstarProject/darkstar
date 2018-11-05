-- Dynamis procs mixin
-- Customization:

require("scripts/globals/mixins")
require("scripts/globals/dynamis")
require("scripts/globals/status")

g_mixins = g_mixins or {}

-- dynamis_currency values:
--  t.whiteshell: 1449
--  o. bronzepiece: 1452
--  1 byne bill: 1455
--  random: 0

g_mixins.dynamis_dreamland = function(mob)
    local proctimes = {
        WS = {
            [1449] = {0,8},
            [1455] = {8,16},
            [1452] = {16,24}
        },
        Magic = {
            [1449] = {8,16},
            [1455] = {16,24},
            [1452] = {0,8}
        },
        JA = {
            [1449] = {16,24},
            [1455] = {0,8},
            [1452] = {8,16}
        }
    }
    mob:addListener("MAGIC_TAKE", "DYNAMIS_MAGIC_PROC_CHECK", function(mob, caster, spell, action)
        local currency = mob:getLocalVar("dynamis_currency")
        local vana_hour = VanadielHour()
        
        if vana_hour >= proctimes.Magic[currency][1] and vana_hour < proctimes.Magic[currency][2] and math.random(0,99) < 8 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "DYNAMIS_WS_PROC_CHECK", function(mob, user, wsid)
        local currency = mob:getLocalVar("dynamis_currency")
        local vana_hour = VanadielHour()
        
        if vana_hour >= proctimes.WS[currency][1] and vana_hour < proctimes.WS[currency][2] and math.random(0,99) < 25 and mob:getLocalVar("dynamis_proc") == 0 then
            dynamis.procMonster(mob,user)
        end
    end)

    mob:addListener("ABILITY_TAKE", "DYNAMIS_ABILITY_PROC_CHECK", function(mob, user, ability, action)
        local currency = mob:getLocalVar("dynamis_currency")
        local vana_hour = VanadielHour()
        
        if vana_hour >= proctimes.JA[currency][1] and vana_hour < proctimes.JA[currency][2] and math.random(0,99) < 20 and mob:getLocalVar("dynamis_proc") == 0 then
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

return g_mixins.dynamis_dreamland
