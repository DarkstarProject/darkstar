-----------------------------------------
-- Spell: Jester's Opperetta
-- Increases Silence Resistance to 
-- Party Members within target AoE
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
	local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

	local power = 50;

	if (sLvl+iLvl > 100) then
		power = power + 15;
	end

	local iBoost = caster:getMod(MOD_ALL_SONGS);
	power = power + iBoost;

	if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
		power = power * 2;
	elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
		power = power * 1.5;
	end
	caster:delStatusEffect(EFFECT_MARCATO);

	local duration = 120;
	duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION)/100) + 1);

	if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
		duration = duration * 2;
	end

	if not (target:addBardSong(caster,EFFECT_OPPERETTA,power,0,duration,caster:getID(), 0, 3)) then
		spell:setMsg(75);
	end

	return EFFECT_OPPERETTA;
end;