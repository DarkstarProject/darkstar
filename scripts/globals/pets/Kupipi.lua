-------------------------------------------------
--  Trust: 	Kupipi
--  Magic: 	Cure I-VI, Protect/ra I-IV Shell/ra I-IV
--    		-na Spells, Slow, Paralyze, Erase, Flash
--  JA: 	None
--  WS: 	Starlight, Moonlight
-- 	Notes: 	Cure sleeping party members
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/weaponskillids")
require("scripts/globals/pets/TrustUtils")

wsList = 
{
	dsp.ws.STARLIGHT,
	dsp.ws.MOONLIGHT
}


SPELL = 
{
	ID 		= 1;
	LEVEL 	= 2;
	MP		= 3;
	CAST 	= 4;
	RECAST 	= 5;
	EFFECT = 6; --REMOVE is only for NA spells and contains the ID for the status effect it cures.
}

SPELL.CURE = 
{
	--CURE[1] -> CURE I
	{1, 1, 8, 2, 5},
	{2, 11, 24, 2, 6},
	{3, 21, 46, 3, 6}, 
	{4, 41, 88, 3, 8}, 
	{5, 61, 135, 3, 10}, 
	{6, 80, 227, 3, 15}
}

SPELL.PROTECT = 
{
	{43, 7, 9, 1, 5}, 
	{44, 27, 28, 1, 5},
	{45, 47, 46, 2, 6},
	{46, 63, 65, 2, 6},
	{47, 76, 84, 2, 10}
} 

SPELL.PROTECTRA = 
{
	{125, 7, 9, 3, 15}, 
	{126, 27, 28, 4, 16}, 
	{127, 47, 46, 5, 17},
	{128, 63, 65, 5, 18},
	{129, 75, 84, 10, 20}
}

SPELL.SHELL = 
{
	{48, 17, 18, 1, 5}, 
	{49, 37, 37, 1, 5}, 
	{50, 57, 56, 2, 6}, 
	{51, 68, 75, 2, 6}, 
	{52, 76, 93, 2, 10}
}
	
SPELL.SHELLRA = 
{
	{130, 17, 18, 3, 15}, 
	{131, 37, 37, 4, 16}, 
	{132, 57, 56, 5, 17}, 
	{133, 68, 75, 5, 18}, 
	{134, 75, 93, 6, 19}
}

SPELL.NA = 
{
	-- CURE is used like a NA spell for sleep here 
	{1, 1, 8, 2, 5, 		dsp.effect.SLEEP_I}, 
	{14, 6, 8, 1, 5, 		dsp.effect.POISON}, 
	{15, 9, 12, 1, 5, 		dsp.effect.PARALYSIS}, 
	{16, 14, 16, 1, 10, 	dsp.effect.BLINDNESS}, 
	{17, 19, 24, 1, 5, 		dsp.effect.SILENCE}, 
	{18, 39, 40, 1, 5, 		dsp.effect.PETRIFICATION},
	{19, 34, 48, 1, 5, 		dsp.effect.DISEASE},
	{20, 29, 30, 1, 10, 	dsp.effect.CURSE_I},
	{143, 61, 24, 1, 30, 	0}
}


SPELL.DEBUFF = 
{
	{56, 13, 15, 2, 20, 	dsp.effect.SLOW},
	{58, 4, 6, 3, 10, 		dsp.effect.PARALYSIS},
	{112, 45, 25, 1, 45, 	dsp.effect.BLINDNESS}
	
}

function onMobSpawn(entity)  
end

function onMobFight(entity, target)
	local ticktime = os.time()
	local party = entity:getMaster():getParty(); 
	if(statusRemovalCheck(entity, party, ticktime)) then
	elseif(healCheck(entity, party, ticktime)) then 
	elseif(buffCheck(entity, party, ticktime)) then 
	elseif(debuffCheck(entity, target, ticktime)) then 
	else
		randomWSCheck(entity, entity, wsList)
	end
	
end

function healCheck(entity, party, ticktime)
	if((ticktime - entity:getLocalVar("heal-tick")) > 0) then 
		for i, member in pairs(party) do 
			local hpp = member:getHPP()
			local heal = 0
			if(hpp <= 30) then --90 for testing 
				heal = getEmergencyCure(entity)
				if(heal ~= 0) then 
					local tick = castMagic(entity, heal, member) + 3
					entity:setLocalVar("heal-tick", ticktime + tick)
					return true
				end
			elseif(hpp <= 65) then 
				heal = getNormalCure(entity)
				if(heal ~= 0) then 
					local tick = castMagic(entity, heal, member) + 3
					entity:setLocalVar("heal-tick", ticktime + tick)
					return true
				end
			end
		end
		entity:setLocalVar("heal-tick", ticktime + 3)
	end
	--entity:setLocalVar("heal-tick", ticktime)
	return false
end

function getEmergencyCure(entity)
    local cureList = SPELL.CURE
    local mp = entity:getMP()
	local lvl = entity:getMainLvl()

	for i = table.maxn(cureList), 1, -1 do 
		local spell = cureList[i]
		if(lvl >= spell[SPELL.LEVEL] and mp >= spell[SPELL.MP] and not 
				entity:hasRecast(1, spell[SPELL.ID])) then  
			return spell
		end
	end
	return 0
end

function getNormalCure(entity)
	local cureList = SPELL.CURE 
	local mp = entity:getMP()
	local lvl = entity:getMainLvl()
	
	for i = table.maxn(cureList), 1, -1 do 
		local spell = cureList[i]
		-- modify spell lvl so that trust isn't spamming expensive new cure 
		if(lvl >= ((spell[SPELL.LEVEL]*1.2) + 5) and mp >= spell[SPELL.MP] and not 
				entity:hasRecast(1, spell[SPELL.ID])) then  
			return spell
		end
	end
	return 0

end

function castMagic(entity, spell, target) 
	if not (entity:hasRecast(1, spell[SPELL.ID])) then 
		entity:castSpell(spell[SPELL.ID], target)
		entity:addRecast(1, spell[SPELL.ID], spell[SPELL.RECAST])
		return spell[SPELL.CAST]
	end
	return 0
end

function statusRemovalCheck(entity, party, ticktime)
	if((ticktime - entity:getLocalVar("status-tick")) > 0) then 
		local maxSpell = table.maxn(SPELL.NA)
		for k, member in pairs(party) do 
			for i = 1, maxSpell, 1 do 
				if(i == maxSpell) then 
					if(member:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE)) then
						if(canCastSpell(entity, SPELL.NA[i])) then  
						local tick = castMagic(entity, SPELL.NA[i], member) + 2
						entity:setLocalVar("status-check", ticktime + tick) 
						return true
						end 
					end
				elseif(member:hasStatusEffect(SPELL.NA[i][SPELL.EFFECT])) then 
					if(canCastSpell(entity, SPELL.NA[i])) then 
						local tick = castMagic(entity, SPELL.NA[i], member) + 2
						entity:setLocalVar("status-check", ticktime + tick)
						return true
					end
				end
			end
		end
		entity:setLocalVar("status-tick", ticktime + 2) 
	end
	
	return false
end

function buffCheck(entity, party, ticktime)
	if((ticktime - entity:getLocalVar("buff-tick")) > 0) then 
		local toProtect = {}
		local toShell = {}
		for k, member in pairs(party) do 
			if not (member:hasStatusEffect(dsp.effect.PROTECT)) then 
				toProtect[table.maxn(toProtect)+1] = member
			elseif not (member:hasStatusEffect(dsp.effect.SHELL)) then 
				toShell[table.maxn(toShell)+1] = member
			end
		end
		-- check protect/protectra
		if(table.maxn(toProtect) > 0) then 
			if(table.maxn(toProtect) == 1) then 
				--single protect required
				local protect = getHighestTierSpell(entity, SPELL.PROTECT)
				if(protect ~= 0) then 
					local tick = castMagic(entity, protect, toProtect[1]) + 10
					entity:setLocalVar("buff-tick", ticktime + tick)
					return true
				end
			else 
				--protectra required 
				local protectra = getHighestTierSpell(entity, SPELL.PROTECTRA)
				if(protectra ~= 0) then 
					local tick = castMagic(entity, protectra, entity) + 10
					entity:setLocalVar("buff-tick", ticktime + tick)
					return true
				end
			end
		-- check shell/shellra
		elseif(table.maxn(toShell) > 0) then
			if(table.maxn(toShell) == 1) then 
				--single shell required
				local shell = getHighestTierSpell(entity, SPELL.SHELL)
				if(shell ~= 0) then 
					local tick = castMagic(entity, shell, toShell[1]) + 10 
					entity:setLocalVar("buff-tick", ticktime + tick)
					return true
				end
			else
				--shellra required
				local shellra = getHighestTierSpell(entity, SPELL.SHELLRA)
				if(shellra ~= 0) then 
					local tick = castMagic(entity, shellra, entity) + 10 
					entity:setLocalVar("buff-tick", ticktime + tick)
					return true
				end
			end
		end

		entity:setLocalVar("buff-tick", ticktime + 10)
	end
	return false
end

function debuffCheck(entity, target, ticktime)
	if((ticktime - entity:getLocalVar("debuff-tick")) > 0) then 
		if((entity:getMP() * 100 / entity:getMaxMP()) > 70) then 
			local list = filterToCastableSpellList(entity, target, SPELL.DEBUFF, 
				function(target, spell)
					return not target:hasStatusEffect(spell[SPELL.EFFECT]) and target:getHPP() > 40
				end)
			if(table.maxn(list) > 0) then 
				local spell = getRandomSpell(entity, list)
				local tick = castMagic(entity, spell, target) + 15
				entity:setLocalVar("debuff-tick", ticktime + tick)
				return true 
			end
		end
		entity:setLocalVar("debuff-tick", ticktime + 5)
	end
	
	return false;
	
end

function filterToCastableSpellList(entity, target, spellList, chkfn)
	local mp = entity:getMP()
	local lvl = entity:getMainLvl()
	local castable = {}
	local i = 1;

	for k, spell in pairs(spellList) do 
		if(lvl >= spell[SPELL.LEVEL] 
			and mp > spell[SPELL.MP] 
			and not entity:hasRecast(1, spell[SPELL.ID])
			and chkfn(target, spell)) then 
			castable[i] = spell 
			i = i + 1
		end
	end
	return castable
end

function getHighestTierSpell(entity, spellList)
	local mp = entity:getMP()
	local lvl = entity:getMainLvl()

	for i = table.maxn(spellList), 1, -1 do 
		local spell = spellList[i]
		if(lvl >= spell[SPELL.LEVEL] and mp >= spell[SPELL.MP]) then  
			return spell
		end
	end
	return 0
end

function canCastSpell(entity, spell)
	local mp = entity:getMP()
	local lvl = entity:getMainLvl()

	return (lvl >= spell[SPELL.LEVEL] and mp >= spell[SPELL.MP] 
		and not entity:hasRecast(1, spell[SPELL.ID]))
end

function getRandomSpell(entity, spellList)
	math.randomseed(os.time())
	return spellList[math.random(1, table.maxn(spellList))]
end