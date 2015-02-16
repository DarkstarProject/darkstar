--------------------------------------
-- Spell: Absorb-Attri
-- Steals an enemy's beneficial status
-- effect.
--------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local durationMods = ABSORB_SPELL_TICK;
	local amountMods = ABSORB_SPELL_AMOUNT
	local weapon = caster:getEquipID(SLOT_MAIN);
	local head = caster:getEquipID(SLOT_HEAD);
	local feet = caster:getEquipID(SLOT_FEET);
	local legs = caster:getEquipID(SLOT_LEGS);
	local hands = caster:getEquipID(SLOT_HANDS);
	local back = caster:getEquipID(SLOT_BACK);

	-- Equipment Bonus Duration
	if (weapon == 18559) then -- Void Scythe
		durationMods = durationMods + 3;
	end
	if (head == 13887) then -- Black Sallet
		durationMods = durationMods + 1;
	end
	if (head == 13888) then -- Onyx Sallet
		durationMods = durationMods + 2;
	end
	if (hands == 14010) then -- Black Gadlings
		durationMods = durationMods + 1;
	end
	if (hands == 14011 or hands == 15013) then -- Onyx Gadlings & Vicious Mufflers
		durationMods = durationMods + 2;
	end
	if (legs == 15400) then --  Black Cuisses
		durationMods = durationMods + 1;
	end
	if (legs == 15401) then --  Onyx Cuisses
		durationMods = durationMods + 2;
	end
	if (feet == 15339) then -- Black Sollerets
		durationMods = durationMods + 1;	
	end
	if (feet == 15340) then -- Onyx Sollerets
		durationMods = durationMods + 2;	
	end
	if (back == 10944) then -- Chuparrosa Mantle
		durationMods = durationMods + 1;	
	end

	-- Equipment Bonus Amount
	if (back == 10944) then -- Chuparrosa Mantle
		amountMods = amountMods + 2;
	end
	if (hands == 11922) then -- Pavor Gauntlets
		amountMods = amountMods + 1;
	end
	if (weapon == 18998 or weapon == 19067 or weapon == 19087) then -- Liberator Lvl 75 - 80 - 85
		amountMods = amountMods + 1;
	end
	if (weapon == 19619 or weapon == 19717 or weapon == 19826) then -- Liberator Lvl 90 - 95 - 99-1
		amountMods = amountMods + 2;
	end
	if (weapon == 19955) then -- Liberator Lvl 99-2
		amountMods = amountMods + 3;
	end	

	if(caster:hasStatusEffect(EFFECT_ACCURACY_BOOST)) then
		spell:setMsg(75); -- no effect
	else
		bonus = AffinityBonus(caster,spell:getElement());
		dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,37,bonus);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(533);
			caster:addStatusEffect(EFFECT_ACCURACY_BOOST,amountMods*resist, durationMods, amountMods*durationMods,FLAG_DISPELABLE); -- caster gains ACC
			target:addStatusEffect(EFFECT_ACCURACY_DOWN,amountMods*resist, durationMods, amountMods*durationMods,FLAG_ERASBLE);    -- target loses ACC
		end
	end
	return EFFECT_ACCURACY_BOOST;
end;