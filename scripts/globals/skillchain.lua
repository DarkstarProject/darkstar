EFFECT_SKILLCHAIN0    = 0x200
EFFECT_SKILLCHAIN1    = 0x400
EFFECT_SKILLCHAIN2    = 0x800
EFFECT_SKILLCHAIN3    = 0x1000
EFFECT_SKILLCHAIN4    = 0x2000
EFFECT_SKILLCHAIN5    = 0x4000
EFFECT_SKILLCHAINMASK = 0x7C00

FLAG_NONE    = 0x00
FLAG_FIRE    = 0x01
FLAG_ICE     = 0x02
FLAG_WIND    = 0x04
FLAG_EARTH   = 0x08
FLAG_THUNDER = 0x10
FLAG_WATER   = 0x20
FLAG_LIGHT   = 0x40
FLAG_DARK    = 0x80

elementIdToFlag = 
{
    FLAG_FIRE,
    FLAG_EARTH,
    FLAG_WATER,
    FLAG_WIND,
    FLAG_ICE,
    FLAG_THUNDER,
    FLAG_LIGHT,
    FLAG_DARK,
    FLAG_NONE,
    FLAG_NONE,
    FLAG_NONE,
    FLAG_NONE
}

function getElementFlag(element)
	if(element > 0 and element < 12) then
		return elementIdToFlag[element];
	else 
		return 0;
	end
end

-- Finds the EFFECT_SKILLCHAIN effect on a target and returns the number of skill chains that have occured
function findSkillChainCount(target)
	local resonance = target:getStatusEffect(EFFECT_SKILLCHAIN);
	
	if(resonance) then
		return getSkillChainCount(resonance);
	end -- if resonance
	
	return 0;
end -- function

-- Returns the number of skill chains that have occured for a given EFFECT_SKILLCHAIN effect
function getSkillChainCount(resonance)
	if(resonance) then
		local chainLength = BitwiseAnd(resonance:getPower(), EFFECT_SKILLCHAINMASK);
	
		if(chainLength > 0) then -- Chain exists
			if(chainLength == EFFECT_SKILLCHAIN1) then
				return 1;
			elseif(chainLength == EFFECT_SKILLCHAIN2) then
				return 2
			elseif(chainLength == EFFECT_SKILLCHAIN3) then
				return 3;
			elseif(chainLength == EFFECT_SKILLCHAIN4) then
				return 4;
			elseif(chainLength == EFFECT_SKILLCHAIN5) then
				return 5;
			end -- if/else chainLength
		end -- if chain
	end
    
    return 0;
end

-- Returns a boolean if the spell's element matches the resonace given
function doesSpellElementMatchResonance(spell, resonance)
	if(spell and resonance) then
		return (BitwiseAnd(resonance:getPower(), getElementFlag(spell:getElement())) > 0);
	end
	
	return false;
end

-- Returns the burst level for a spell / target combination
function getMagicBurstLevel(spell, target)
    local resonance = target:getStatusEffect(EFFECT_SKILLCHAIN);

    if(resonance) then -- Resonance exists
		if(doesSpellElementMatchResonance(spell, resonance)) then
			return getSkillChainCount(resonance);
		end
    end -- if resonance
    
    return 0;
end