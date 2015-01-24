--------------------------------------
-- Spell: Sage Etude
-- Enhances Intelligence of target party
-- member.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local enchanceSkill = caster:getSkillLevel(40); -- Singing Skill
	local duration = 120;
	local power = 0;

	if(enchanceSkill <416)then
		power = 12
	elseif(enchanceSkill >=417 and enchanceSkill <=445)then
		power = 13
	elseif(enchanceSkill >=446 and enchanceSkill <=474)then
		power = 14
	elseif(enchanceSkill >=475)then
		power = 15
	else
		power = 15
	end

	duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));

	power = power + target:getMod(MOD_ETUDE) + target:getMod(MOD_ALL_SONGS);
	
	if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
		power = power * 2;
	elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
		power = power * 1.5;
	end
	caster:delStatusEffect(EFFECT_MARCATO);
    
	if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
		duration = duration * 2;
	end

	if not (target:addBardSong(caster,EFFECT_ETUDE,power,10,duration,caster:getID(), 5, 2)) then
	        spell:setMsg(75);
	end

	return EFFECT_ETUDE;
end;