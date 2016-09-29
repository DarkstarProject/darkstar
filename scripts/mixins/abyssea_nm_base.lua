-- Abyssea NM mixin base
-- Don't require this one - use abyssea_nm for regular spawned NMs and abyssea_nm_forced for force pops

require("scripts/globals/mixins")
require("scripts/globals/abyssea")

g_mixins = g_mixins or {}

g_mixins.abyssea_nm_base = function(mob)
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

return g_mixins.abyssea_nm_base
