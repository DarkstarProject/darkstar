-----------------------------------------
-- Spell: Trion
-----------------------------------------
	require("scripts/globals/trusts");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUseMisc(dsp.zoneMisc.PET)) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    elseif (not caster:hasTrust(dsp.trust.VOLKER)) then
		local msg = caster:checkTrust(dsp.trust.VOLKER);
		if(msg > 0) then
			return msg
		end
    else
        return 299
    end
	return 0;
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    caster:spawnTrust(dsp.trust.VOLKER) -- see pet_list.sql, this should be 896 but the pet list won't let me do that
    return 0
end