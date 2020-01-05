-----------------------------------------
-- Trust: Naji
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    caster:spawnTrust(897)
    return 0
end
