-----------------------------------------
-- Trust: Trion
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    caster:spawnTrust(905)
    return 0
end
