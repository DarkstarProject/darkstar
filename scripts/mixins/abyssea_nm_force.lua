-- Abyssea NM mixin for forced pops
-- Customization:

require("scripts/globals/mixins")
require("scripts/globals/abyssea")

g_mixins = g_mixins or {}

g_mixins.abyssea_nm_force = function(mob)
    mob:addListener("SPAWN", "ABYSSEA_WEAKNESS_SET", function(mob)
        mob:setLocalVar("abyssea_magic_weak", getNewYellowWeakness(mob))
        mob:setLocalVar("abyssea_ele_ws_weak", getNewRedWeakness(mob))
        mob:setLocalVar("abyssea_phys_ws_weak", getNewBlueWeakness(mob))
    end)
end

return g_mixins.abyssea_nm_force, require("scripts/mixins/abyssea_nm_base")
