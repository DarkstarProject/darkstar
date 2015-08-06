-----------------------------------------
-- Spell: AirSpirit
-- Summons AirSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	local result = 0;
	if(caster:getObjType() == TYPE_PC) then
		result = avatarMiniFightCheck(caster);
	elseif(caster:hasPet()) then
        result = 1;
    elseif (not caster:canUsePet()) then
		result = MSGBASIC_CANT_BE_USED_IN_AREA;
    end
	return result;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_AIR_SPIRIT);

	return 0;
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(pet,target,player)
		
	local pmjob = player:getMainJob();
	local pmLvL = player:getMainLvl();
	local psjob = player:getSubJob();
	local psLvL = player:getSubLvl();
	--local pet = player:hasPet(PET_AIR_SPIRIT);
	local recast = (48 + (utils.clamp(summoner:getMaxSkillLevel(SKILL_SUM) - summoner:getSkillLevel(SKILL_SUM))) / 3);
	local Y = 0
	local rand = math.random( 0, Y );
	local Spell_list = [spell list here]
	if (pmjob == 15) then
		if (psjob == 15) then 
			pmLvl = (floor(pmLvl/2))
		else
		    pmLvL = { 
		    [9] = function (x) Y = 1 end ,
		    [15] = function (x) Y = 2 end,
		    [20] = function (x) Y = 3 end,
		    [21] = function (x) Y = 4 end,
		    [34] = function (x) Y = 5 end,
		    [52] = function (x) Y = 6 end,
		    [59] = function (x) Y = 7 end,
		    [83] = function (x) Y = 8 end,
		    }
		end
	end
	 if (Y = 1) then 
		if (rand == Y) then 
		pet:castSpell
	elseif ...
	
end;