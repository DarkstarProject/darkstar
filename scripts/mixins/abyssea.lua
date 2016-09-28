-- Abyssea mixin
-- Customization:

require("scripts/globals/mixins")
require("scripts/globals/abyssea")

g_mixins = g_mixins or {}

g_mixins.abyssea = function(mob)
    mob:addListener("ENGAGE", "ABYSSEA_ENGAGE", function(mob)
        mob:setLocalVar("abyssea_magic_weak", getNewYellowWeakness(mob))
        mob:setLocalVar("abyssea_ele_ws_weak", getNewRedWeakness(mob))
        mob:setLocalVar("abyssea_phys_ws_weak", getNewBlueWeakness(mob))
    end)

    mob:addListener("MAGIC_TAKE", "ABYSSEA_MAGIC_PROC_CHECK", function(mob, caster, spell, action)
        if spell:getID() == mob:getLocalVar("abyssea_magic_weak") then
            --TODO: weakness trigger effects
            mob:weaknessTrigger(1);
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "ABYSSEA_WS_PROC_CHECK", function(mob, user, wsid)
        if wsid == mob:getLocalVar("abyssea_ele_ws_weak") then
            --TODO: weakness trigger effects
            mob:weaknessTrigger(2);
        elseif wsid == mob:getLocalVar("abyssea_phys_ws_weak") then
            --TODO: weakness trigger effects
            mob:weaknessTrigger(0);
        end
    end)
end

return g_mixins.abyssea
