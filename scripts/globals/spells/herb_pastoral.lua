-----------------------------------------
-- Spell: Herb Pastoral
-- Increases Poison Resistance to 
-- Party Members within target AoE
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	-- Mostly Guestimate ??
	local power = 20;

	local iBoost = caster:getMod(MOD_ALL_SONGS);
	if (iBoost > 0) then
		power = power + 1 + (iBoost-1)*3;
	end

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

	if not (target:addBardSong(caster,EFFECT_PASTORAL,power,0,duration,caster:getID(), 0, 2)) then
		spell:setMsg(75);
	end

	return EFFECT_PASTORAL;
end;