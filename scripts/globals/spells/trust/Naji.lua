-----------------------------------------
-- Spell: Naji
-----------------------------------------
-- require("scripts/globals/trust");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:hasHate()) then
	    caster:messageBasic(700,0,0)
		-- return dsp.msg.basic.UNABLE_TO_SPAWN_TRUST,0,0
    else
        return 0
    end
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    caster:spawnTrust(2)
    return 0
end
