-- Abyssea NM mixin (for non-force popped NMs)
-- Customization:

require("scripts/globals/mixins")
require("scripts/globals/abyssea")

g_mixins = g_mixins or {}

g_mixins.abyssea_nm = function(mob)
    mob:addListener("ENGAGE", "ABYSSEA_WEAKNESS_SET", function(mob)
        mob:setLocalVar("abyssea_magic_weak", getNewYellowWeakness(mob))
        mob:setLocalVar("abyssea_ele_ws_weak", getNewRedWeakness(mob))
        mob:setLocalVar("abyssea_phys_ws_weak", getNewBlueWeakness(mob))
        mob:setLocalVar("abyssea_blue_proc_count", 0)
        mob:setLocalVar("abyssea_red_proc_count", 0)
        mob:setLocalVar("abyssea_yellow_proc_count", 0)
    end)
    mob:addListener("MAGIC_TAKE", "ABYSSEA_MAGIC_PROC_CHECK", function(mob, caster, spell, action)
        if mob:canChangeState() then
            if spell:getID() == mob:getLocalVar("abyssea_magic_weak") then
                --TODO: weakness trigger message
                mob:weaknessTrigger(1)
                mob:addStatusEffect(dsp.effect.SILENCE,0,0,30)
                mob:setLocalVar("abyssea_yellow_proc_count", mob:getLocalVar("abyssea_yellow_proc_count" + 1))
            else
                --discernment
            end
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "ABYSSEA_WS_PROC_CHECK", function(mob, user, wsid)
        if mob:canChangeState() then
            if wsid == mob:getLocalVar("abyssea_ele_ws_weak") then
                --TODO: weakness trigger message
                mob:weaknessTrigger(2)
                mob:addStatusEffect(dsp.effect.TERROR,0,0,30)
                mob:setLocalVar("abyssea_red_proc_count", mob:getLocalVar("abyssea_red_proc_count" + 1))
            elseif wsid == mob:getLocalVar("abyssea_phys_ws_weak") then
                --TODO: weakness trigger message
                mob:weaknessTrigger(0)
                mob:addStatusEffect(dsp.effect.AMNESIA,0,0,30)
                mob:setLocalVar("abyssea_blue_proc_count", mob:getLocalVar("abyssea_blue_proc_count" + 1))
            else
                --discernment (figure out if ws is elemental...)
            end
        end
    end)

    mob:addListener("DEATH", "ABYSSEA_KI_DISTRIBUTION", function(mob, killer)
        --TODO: message
        local ki1 = mob:getLocalVar("ABYSSEA_PKI_DROP")
        local ki2 = mob:getLocalVar("ABYSSEA_TKI_DROP")
        if ki1 ~= 0 or ki2 ~= 0 then
            for _,player in killer:getAlliance() do
                local chance = 100 - ((mob:getLocalVar("abyssea_red_proc_count") - 1) * 10)
                if mob:getLocalVar("abyssea_red_proc_count") == 0 then
                    chance = 10
                end
                if math.random(0,99) < chance then
                    if ki1 ~= 0 then
                        player:addKeyItem(ki1)
                    end
                    if ki2 ~= 0 then
                        player:addKeyItem(ki2)
                    end
                end
            end
        end
    end)
end

return g_mixins.abyssea_nm
