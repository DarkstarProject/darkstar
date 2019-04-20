-----------------------------------------
-- Spell: Excenmille
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:hasHate()) then
	    caster:messageBasic(700,0,0)
    else
        return 0
    end
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    caster:spawnTrust(4)
    return 0
end
