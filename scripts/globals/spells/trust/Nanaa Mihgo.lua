-----------------------------------------
-- Spell: Nanaa Mihgo
-----------------------------------------
require("scripts/globals/msg");

function onMagicCastingCheck(caster,target,spell)
    if (caster:hasHate()) then
	    caster:messageBasic(700,0,0)
    else
        return 0
    end
end

function onSpellCast(caster,target,spell)
    caster:spawnTrust(6)
    return 0
end