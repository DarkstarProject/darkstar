-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------
require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");
require("scripts/globals/utils");
-----------------------------------

-----------------------------------
-- getMaxTravStones
-- returns Traverser Stone KI cap
-----------------------------------

function getMaxTravStones(player)
    local MaxTravStones = 3;
    if(player:hasKeyItem(VIRIDIAN_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    if(player:hasKeyItem(IVORY_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    if(player:hasKeyItem(VERMILLION_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    return MaxTravStones;
end;

-----------------------------------
-- getTravStonesTotal
-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
-----------------------------------

function getTravStonesTotal(player)
    local STONES = 0;
    if(player:hasKeyItem(TRAVERSER_STONE1)) then
        STONES = STONES + 1;
    end
    if(player:hasKeyItem(TRAVERSER_STONE2)) then
        STONES = STONES + 1;
    end
    if(player:hasKeyItem(TRAVERSER_STONE3)) then
        STONES = STONES + 1;
    end
    if(player:hasKeyItem(TRAVERSER_STONE4)) then
        STONES = STONES + 1;
    end
    if(player:hasKeyItem(TRAVERSER_STONE5)) then
        STONES = STONES + 1;
    end
    if(player:hasKeyItem(TRAVERSER_STONE6)) then
        STONES = STONES + 1;
    end
    return STONES;
end;

-----------------------------------
-- spendTravStones
-- removes Traverser Stone KIs
-----------------------------------

function spendTravStones(player,spentstones)
    if(spentstones == 4) then
        if(player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif(player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif(player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif(player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif(player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif(player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if(spentstones == 3) then
        if(player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif(player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif(player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif(player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif(player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif(player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if(spentstones == 2) then
        if(player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif(player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif(player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif(player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif(player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif(player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if(spentstones == 1) then
        if(player:hasKeyItem(TRAVERSER_STONE6)) then
            player:delKeyItem(TRAVERSER_STONE6);
        elseif(player:hasKeyItem(TRAVERSER_STONE5)) then
            player:delKeyItem(TRAVERSER_STONE5);
        elseif(player:hasKeyItem(TRAVERSER_STONE4)) then
            player:delKeyItem(TRAVERSER_STONE4);
        elseif(player:hasKeyItem(TRAVERSER_STONE3)) then
            player:delKeyItem(TRAVERSER_STONE3);
        elseif(player:hasKeyItem(TRAVERSER_STONE2)) then
            player:delKeyItem(TRAVERSER_STONE2);
        elseif(player:hasKeyItem(TRAVERSER_STONE1)) then
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
end;

-----------------------------------
-- getAbyssiteTotal
-- returns total "Abyssite of <thing>"
-----------------------------------

function getAbyssiteTotal(player,Type)
    local SOJOURN = 0;
    local FURTHERANCE = 0;
    local MERIT = 0;
    if (Type == "SOJOURN") then
        if(player:hasKeyItem(IVORY_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if(player:hasKeyItem(SCARLET_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if(player:hasKeyItem(JADE_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if(player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if(player:hasKeyItem(INDIGO_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if(player:hasKeyItem(EMERALD_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        return SOJOURN;
    elseif (Type == "FURTHERANCE") then
        if (player:hasKeyItem(SCARLET_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        if (player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        return FURTHERANCE;
    elseif (Type == "MERIT") then
        if (player:hasKeyItem(AZURE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(VIRIDIAN_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(JADE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(INDIGO_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        return MERIT;
    end
end;

-----------------------------------
-- getDemiluneAbyssite
-- returns total value of Demulune KeyItems
-----------------------------------

function getDemiluneAbyssite(player)
    local Demilune = 0;
    if (player:hasKeyItem(CLEAR_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1;
    end
    if (player:hasKeyItem(COLORFUL_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 2;
    end
    if (player:hasKeyItem(SCARLET_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 4;
    end
    if (player:hasKeyItem(AZURE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 8;
    end
    if (player:hasKeyItem(VIRIDIAN_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 16;
    end
    if (player:hasKeyItem(JADE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 32;
    end
    if (player:hasKeyItem(SAPPHIRE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 64;
    end
    if (player:hasKeyItem(CRIMSON_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 128;
    end
    if (player:hasKeyItem(EMERALD_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 256;
    end
    if (player:hasKeyItem(VERMILLION_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 512;
    end
    if (player:hasKeyItem(INDIGO_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1024;
    end
    return Demilune;
end;

-- function WhatKilledMe(mob,target)
	-- local Action = target:getCurrentAction();
	-- if (Action == ACTION_WEAPONSKILL_START) then
		-- target:setVar("Action",1);
	-- elseif (Action == ACTION_MAGIC_CASTING) then
		-- target:setVar("Action",2);
	-- elseif (Action == ACTION_NONE) or (Action == ACTION_RANGED_START) then
		-- target:setVar("Action",0);
	-- end
-- end;

-----------------------------------
-- Calculating lights
-----------------------------------

function DoLights(mob,killer)

	----------------------
	-- Lights
	----------------------
	local ran1 = math.random(2,5);
	local ran2 = math.random(5,8);
	local NMbonus = math.random(32,128);
	local bonus = 0;
    local pearl = killer:getVar("LightPearl");
	local ruby = killer:getVar("LightRuby");
	local amber = killer:getVar("LightAmber");
	local azure = killer:getVar("LightAzure");
	local pearllight = pearl+ran1+bonus;
	local rubylight = ruby+ran2+bonus;
	local amberlight = amber+ran2+bonus;
	local azurelight = azure+ran2+bonus;

	--------------------------------------------
	-- 		Add lights on mob death
	--------------------------------------------
	local lightchance = 1; --math.random(0,3);
	--local action = killer:getVar("Action");

	if mob:isNM() then
		bonus = NMbonus;
	else
		bonus = bonus;
	end

	-- if (action == 0) and (lightchance == 1) then
		-- if (pearl > 230) then
			-- killer:setVar("LightPearl",230);
		-- else
			-- killer:setVar("LightPearl",pearllight);
		-- end
	--if (GetWeaponSkill() == true) and (lightchance == 1) then
		--if (amber > 255) then
		--	killer:setVar("LightAmber",255);
		--else
		--	killer:setVar("LightAmber",amberlight);
		--end
	-- elseif (action == 2) and (lightchance == 1) then
		-- if (azure > 255) then
			-- killer:setVar("LightAzure",255);
		-- else
			-- killer:setVar("LightAzure",azurelight);
		-- end
	-- elseif (math.random(10) == 1) then
		-- if (ruby > 255) then
			-- killer:setVar("LightRuby",255);
		-- else
			-- killer:setVar("LightRuby",rubylight);
		-- end
	--end
end;

-----------------------------------
-- 		Check Lights on /heal
-----------------------------------
function checklights(target, effect)
	local TextIDs = "scripts/zones/" .. target:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);

    local param0 = target:getVar("LightPearl");
	local param1 = target:getVar("LightEbon");
	local param2 = target:getVar("LightGold");
	local param3 = target:getVar("LightSilver");
	local param4 = target:getVar("LightAzure");
	local param5 = target:getVar("LightRuby");
	local param6 = target:getVar("LightAmber");
	local Tick = target:getVar("Abysseatime");
	--/60
    if target:hasStatusEffect(EFFECT_VISITANT) and target:hasStatusEffect(EFFECT_HEALING) then
		target:messageSpecial(SHOW_LIGHTS,param0,param1,param2,param3);
		target:messageSpecial(SHOW_LIGHTS2,param4,param5,param6);
		-- target:messageSpecial(TIME_REMAINING, (Tick/60), 1, 0);
		target:messageBasic(202, Tick);
	end
end;



-----------------------------------
-- Calculating cruor drop from mobs
-----------------------------------

function DoCruor(mob,killer)
	local TextIDs = "scripts/zones/" .. killer:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);

	local zone = killer:getZone();
    local silver = killer:getVar("LightSilver");
	local mycruor = killer:getCruor();
	if (zone == 132 or zone == 15 or zone == 45 or
		zone == 215 or zone == 216 or zone == 217 or
		zone == 218 or zone == 253 or zone == 254) then
		cruor = (10+silver*2);
		killer:addCruor(cruor);
		killer:messageSpecial(CRUOR_OBTAINED,cruor,mycruor,0,0,zone);
	end
end;

-----------------------------------
-- Exp bonus from Ebon Light
-----------------------------------

function DoExp(mob,killer)

	local bonus = killer:getVar("LightEbon");
	local caprate = 100;
	if (mob:checkBaseExp() == true) then
		if (zone == 132 or zone == 15 or zone == 45 or
			zone == 215 or zone == 216 or zone == 217 or
			zone == 218 or zone == 253 or zone == 254) then
			if (bonus >= 100) then
				bonus = caprate;
			end
		end
		killer:addExp(bonus * 2);
	end
end;



-----------------------------------------
-- Setting up Weakness with onMobEngaged
-----------------------------------------
function WeaknessTriggerSet(mob,target,ws,spell)
	target:setVar("RED_PROC",0); 	-- Reset Proc
	target:setVar("BLUE_PROC",0);	-- Reset Proc
	target:setVar("YELLOW_PROC",0);	-- Reset Proc
	--[[-----------------------------------------------------------------------------
	-- Weakness Red - triggered by using a specific elemental Weapon Skill on the NM.
	---------------------------------------------------------------------------------
	Red Weakness 	Triggers By Weapon

	Weapon Type 	Weapon Skills		ID
	---------------------------------------
	Club			Seraph Strike		161
	---------------------------------------
	Dagger			Cyclone				20
					Energy Drain		22
	---------------------------------------
	Great Katana	Tachi: Jinpu		148
					Tachi: Koki			149
	---------------------------------------
	Great Sword		Freezebite			51
	---------------------------------------
	Katana			Blade: Ei			133
	---------------------------------------
	Polearm			Raiden Thrust		114
	---------------------------------------
	Scythe			Shadow of Death		98
	---------------------------------------
	Staff			Sunburst			180
					Earth Crusher		178
	---------------------------------------
	Sword			Red Lotus Blade		34
					Seraph Blade		37
	------------------------------------]]--
	-- trigger [0 = Yellow] [1 = blue] [2 = Red] [3 = White]
	-- Trigger can be[ day before <- current day -> day after

	local DayElement = VanadielDayElement();

	if (DayElement == 0) then
		local Wskill = math.random(1,5);
		if (Wskill == 1) then WSRED = 34;
		elseif (Wskill == 2) then WSRED = 22;
		elseif (Wskill == 3) then WSRED = 98;
		elseif (Wskill == 4) then WSRED = 178;
		elseif (Wskill == 5) then WSRED = 133;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 1) then
		local Wskill = math.random(1,2);
		if (Wskill == 1) then WSRED = 178;
		elseif (Wskill == 2) then WSRED = 34;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 2) then
		local Wskill = math.random(1,2);
		if (Wskill == 1) then WSRED = 178;
		elseif (Wskill == 2) then WSRED = 20;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 3) then
		local Wskill = math.random(1,3);
		if (Wskill == 1) then WSRED = 148;
		elseif (Wskill == 2) then WSRED = 20;
		elseif (Wskill == 3) then WSRED = 51;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 4) then
		local Wskill = math.random(1,3);
		if (Wskill == 1) then WSRED = 51;
		elseif (Wskill == 2) then WSRED = 114;
		elseif (Wskill == 3) then WSRED = 148;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 5) then
		local Wskill = math.random(1,6);
		if (Wskill == 1) then WSRED = 114;
		elseif (Wskill == 2) then WSRED = 51;
		elseif (Wskill == 3) then WSRED = 149;
		elseif (Wskill == 4) then WSRED = 161;
		elseif (Wskill == 5) then WSRED = 180;
		elseif (Wskill == 6) then WSRED = 37;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 6) then
		local Wskill = math.random(1,8);
		if (Wskill == 1) then WSRED = 149;
		elseif (Wskill == 2) then WSRED = 161;
		elseif (Wskill == 3) then WSRED = 180;
		elseif (Wskill == 4) then WSRED = 37;
		elseif (Wskill == 5) then WSRED = 22;
		elseif (Wskill == 6) then WSRED = 133;
		elseif (Wskill == 7) then WSRED = 98;
		elseif (Wskill == 8) then WSRED = 114;
		end
		target:setVar("RedTrigger", WSRED);

	elseif (DayElement == 7) then
		local Wskill = math.random(1,8);
		if (Wskill == 1) then WSRED = 22;
		elseif (Wskill == 2) then WSRED = 133;
		elseif (Wskill == 3) then WSRED = 98;
		elseif (Wskill == 4) then WSRED = 149;
		elseif (Wskill == 5) then WSRED = 161;
		elseif (Wskill == 6) then WSRED = 180;
		elseif (Wskill == 7) then WSRED = 37;
		elseif (Wskill == 8) then WSRED = 34;
		end
		target:setVar("RedTrigger", WSRED);
	end
	--[[-----------------------------------------------------------------------------
	-- Weakness Blue - triggered by using a specific physical Weapon Skill on the NM.
	---------------------------------------------------------------------------------
			[6:00-14:00 - Piercing]
	--------------------------------------------
	Weapon Type 		Weapon Skills		ID
	--------------------------------------------
	Archery				Sidewinder			196
						Blast Arrow			197
						Arching Arrow 		198
						Empyreal Arrow		199
	-------------------------------------------
	Marksmanship		Slug Shot 			212
						Blast Shot 			213
						Heavy Shot 			214
						Detonator			215
	-------------------------------------------
	Dagger 				Shadowstitch 		18
						Dancing Edge 		23
						Shark Bite 			24
						Evisceration		25
	-------------------------------------------
	Polearm				Skewer 				118
						Wheeling Thrust 	119
						Impulse Drive		120
	-------------------------------------------
			[14:00-22:00 - Slashing]
	-------------------------------------------
	Weapon Type 		Weapon Skills		ID
	-------------------------------------------
	Sword				Vorpal Blade 		40
						Swift Blade 		41
						Savage Blade		42
	-------------------------------------------
	Katana				Blade: Ten 			135
						Blade: Ku			136
	-------------------------------------------
	Axe					Mistral Axe 		71
						Decimation			72
	-------------------------------------------
	Scythes				Cross Reaper 		103
						Spiral Hell			104
	-------------------------------------------
	Great Axe			Full Break 			87
						Steel Cyclone		88
	-------------------------------------------
	Great Katana		Tachi: Gekko 		151
						Tachi: Kasha		152
	-------------------------------------------
	Great Sword			Spinning Slash 		55
						Ground Strike		56
	-------------------------------------------
			[22:00-6:00 - Blunt]
	-------------------------------------------
	Weapon Type 		Weapon Skills		ID
	-------------------------------------------
	Club				Skullbreaker 		165
						True Strike 		166
						Judgment 			167
						Hexa Strike 		168
						Black Halo			169
	-------------------------------------------
	Hand-to-Hand		Raging Fists 		5
						Spinning Attack 	6
						Howling Fist 		7
						Dragon Kick 		8
						Asuran Fists		9
	-------------------------------------------
	Staff				Heavy Swing 		176
						Shell Crusher 		181
						Full Swing 			182
						Spirit Taker 		183
						Retribution			184
	---------------------------------------]]--

	local TimeBlue = VanadielHour();

	if (TimeBlue >= 6) and (TimeBlue <= 13) then
		local WSTYPE = math.random(0,14);
		if (WSTYPE == 0) then WSBLUE = 196;
		elseif (WSTYPE == 1) then WSBLUE = 197;
		elseif (WSTYPE == 2) then WSBLUE = 198;
		elseif (WSTYPE == 3) then WSBLUE = 199;
		elseif (WSTYPE == 4) then WSBLUE = 212;
		elseif (WSTYPE == 5) then WSBLUE = 213;
		elseif (WSTYPE == 6) then WSBLUE = 214;
		elseif (WSTYPE == 7) then WSBLUE = 215;
		elseif (WSTYPE == 8) then WSBLUE = 18;
		elseif (WSTYPE == 9) then WSBLUE = 23;
		elseif (WSTYPE == 10) then WSBLUE = 24;
		elseif (WSTYPE == 11) then WSBLUE = 25;
		elseif (WSTYPE == 12) then WSBLUE = 118;
		elseif (WSTYPE == 13) then WSBLUE = 119;
		elseif (WSTYPE == 14) then WSBLUE = 120;
		end
		target:setVar("BlueTrigger",WSBLUE);

	elseif (TimeBlue >= 14) and (TimeBlue <= 21) then
		local WSTYPE = math.random(0,15);
		if (WSTYPE == 0) then WSBLUE = 40;
		elseif (WSTYPE == 1) then WSBLUE = 41;
		elseif (WSTYPE == 2) then WSBLUE = 42;
		elseif (WSTYPE == 3) then WSBLUE = 199;
		elseif (WSTYPE == 4) then WSBLUE = 135;
		elseif (WSTYPE == 5) then WSBLUE = 136;
		elseif (WSTYPE == 6) then WSBLUE = 71;
		elseif (WSTYPE == 7) then WSBLUE = 72;
		elseif (WSTYPE == 8) then WSBLUE = 103;
		elseif (WSTYPE == 9) then WSBLUE = 104;
		elseif (WSTYPE == 10) then WSBLUE = 87;
		elseif (WSTYPE == 11) then WSBLUE = 88;
		elseif (WSTYPE == 12) then WSBLUE = 151;
		elseif (WSTYPE == 13) then WSBLUE = 152;
		elseif (WSTYPE == 14) then WSBLUE = 55;
		elseif (WSTYPE == 15) then WSBLUE = 56;
		end
		target:setVar("BlueTrigger",WSBLUE);

	elseif (TimeBlue >= 22) and (TimeBlue <= 5) then
		local WSTYPE = math.random(0,14);
		if (WSTYPE == 0) then WSBLUE = 165;
		elseif (WSTYPE == 1) then WSBLUE = 166;
		elseif (WSTYPE == 2) then WSBLUE = 167;
		elseif (WSTYPE == 3) then WSBLUE = 168;
		elseif (WSTYPE == 4) then WSBLUE = 169;
		elseif (WSTYPE == 5) then WSBLUE = 5;
		elseif (WSTYPE == 6) then WSBLUE = 6;
		elseif (WSTYPE == 7) then WSBLUE = 7;
		elseif (WSTYPE == 8) then WSBLUE = 8;
		elseif (WSTYPE == 9) then WSBLUE = 9;
		elseif (WSTYPE == 10) then WSBLUE = 176;
		elseif (WSTYPE == 11) then WSBLUE = 181;
		elseif (WSTYPE == 12) then WSBLUE = 182;
		elseif (WSTYPE == 13) then WSBLUE = 183;
		elseif (WSTYPE == 14) then WSBLUE = 184;
		end
		target:setVar("BlueTrigger",WSBLUE);
	end
	--[[----------------
	FIRESDAY		= 0,
	EARTHSDAY		= 1,
	WATERSDAY		= 2,
	WINDSDAY		= 3,
	ICEDAY			= 4,
	LIGHTNINGDAY	= 5,
	LIGHTSDAY		= 6,
	DARKSDAY		= 7
	--------------------
	Yellow Weakness Triggers
	-------------------------------------------
	Element			Spell					ID
	-------------------------------------------
	Fire			Fire III				146
					Fire IV					147
					Firaga III				176
					Flare					204
					Heat Breath				591
					Katon: Ni				321
					Ice Threnody			455
	-------------------------------------------
	Earth			Stone III				161
					Stone IV				162
					Stonega III				191
					Quake					210
					Magnetite Cloud			555
					Doton: Ni				330
					Lightning Threnody		458
	-------------------------------------------
	Water			Water III				171
					Water IV				172
					Waterga III				201
					Flood					214
					Maelstrom				515
					Suiton: Ni				336
					Fire Threnody			454
	-------------------------------------------
	Wind			Aero III				156
					Aero IV					157
					Aeroga III				186
					Tornado					208
					Mysterious Light		534
					Huton: Ni				327
					Earth Threnody			457
	-------------------------------------------
	Ice				Blizzard III			151
					Blizzard IV				152
					Blizzaga III			181
					Freeze					206
					Ice Break				531
					Hyoton: Ni				324
					Wind Threnody			456
	-------------------------------------------
	Lightning		Thunder III				166
					Thunder IV				167
					Thundaga III			196
					Burst					212
					Mind Blast				644
					Raiton: Ni				333
					Water Threnody			459
	-------------------------------------------
	Light			Banish II				29
					Banish III				30
					Banishga II				39
					Holy					21
					Flash					112
					Radiant Breath			565
					Dark Threnody			461
	-------------------------------------------
	Dark			Aspir					247
					Drain					245
					Bio II					231
					Dispel					260
					Eyes On Me				557
					Kurayami: Ni			348
					Light Threnody			460
	---------------------------------------]]--
	local DayElement = VanadielDayElement();

	if (DayElement == 0) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 146;
		elseif (SPELL == 2) then YELLOW = 147;
		elseif (SPELL == 3) then YELLOW = 176;
		elseif (SPELL == 4) then YELLOW = 204;
		elseif (SPELL == 5) then YELLOW = 591;
		elseif (SPELL == 6) then YELLOW = 321;
		elseif (SPELL == 7) then YELLOW = 455;
		elseif (SPELL == 8) then YELLOW = 161;
		elseif (SPELL == 9) then YELLOW = 162;
		elseif (SPELL == 10) then YELLOW = 191;
		elseif (SPELL == 11) then YELLOW = 210;
		elseif (SPELL == 12) then YELLOW = 555;
		elseif (SPELL == 13) then YELLOW = 330;
		elseif (SPELL == 14) then YELLOW = 458;
		elseif (SPELL == 15) then YELLOW = 247;
		elseif (SPELL == 16) then YELLOW = 245;
		elseif (SPELL == 17) then YELLOW = 231;
		elseif (SPELL == 18) then YELLOW = 260;
		elseif (SPELL == 19) then YELLOW = 557;
		elseif (SPELL == 20) then YELLOW = 348;
		elseif (SPELL == 21) then YELLOW = 460;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 1) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 330;
		elseif (SPELL == 2) then YELLOW = 161;
		elseif (SPELL == 3) then YELLOW = 162;
		elseif (SPELL == 4) then YELLOW = 191;
		elseif (SPELL == 5) then YELLOW = 210;
		elseif (SPELL == 6) then YELLOW = 555;
		elseif (SPELL == 7) then YELLOW = 458;
		elseif (SPELL == 8) then YELLOW = 171;
		elseif (SPELL == 9) then YELLOW = 172;
		elseif (SPELL == 10) then YELLOW = 201;
		elseif (SPELL == 11) then YELLOW = 214;
		elseif (SPELL == 12) then YELLOW = 515;
		elseif (SPELL == 13) then YELLOW = 336;
		elseif (SPELL == 14) then YELLOW = 454;
		elseif (SPELL == 15) then YELLOW = 146;
		elseif (SPELL == 16) then YELLOW = 147;
		elseif (SPELL == 17) then YELLOW = 176;
		elseif (SPELL == 18) then YELLOW = 204;
		elseif (SPELL == 19) then YELLOW = 591;
		elseif (SPELL == 20) then YELLOW = 321;
		elseif (SPELL == 21) then YELLOW = 455;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 2) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 458;
		elseif (SPELL == 2) then YELLOW = 171;
		elseif (SPELL == 3) then YELLOW = 172;
		elseif (SPELL == 4) then YELLOW = 201;
		elseif (SPELL == 5) then YELLOW = 214;
		elseif (SPELL == 6) then YELLOW = 515;
		elseif (SPELL == 7) then YELLOW = 336;
		elseif (SPELL == 8) then YELLOW = 454;
		elseif (SPELL == 9) then YELLOW = 156;
		elseif (SPELL == 10) then YELLOW = 157;
		elseif (SPELL == 11) then YELLOW = 186;
		elseif (SPELL == 12) then YELLOW = 208;
		elseif (SPELL == 13) then YELLOW = 534;
		elseif (SPELL == 14) then YELLOW = 327;
		elseif (SPELL == 15) then YELLOW = 457;
		elseif (SPELL == 16) then YELLOW = 161;
		elseif (SPELL == 17) then YELLOW = 162;
		elseif (SPELL == 18) then YELLOW = 191;
		elseif (SPELL == 19) then YELLOW = 210;
		elseif (SPELL == 20) then YELLOW = 555;
		elseif (SPELL == 21) then YELLOW = 330;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 3) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 156;
		elseif (SPELL == 2) then YELLOW = 157;
		elseif (SPELL == 3) then YELLOW = 186;
		elseif (SPELL == 4) then YELLOW = 208;
		elseif (SPELL == 5) then YELLOW = 534;
		elseif (SPELL == 6) then YELLOW = 327;
		elseif (SPELL == 7) then YELLOW = 457;
		elseif (SPELL == 8) then YELLOW = 151;
		elseif (SPELL == 9) then YELLOW = 152;
		elseif (SPELL == 10) then YELLOW = 181;
		elseif (SPELL == 11) then YELLOW = 206;
		elseif (SPELL == 12) then YELLOW = 531;
		elseif (SPELL == 13) then YELLOW = 324;
		elseif (SPELL == 14) then YELLOW = 456;
		elseif (SPELL == 15) then YELLOW = 171;
		elseif (SPELL == 16) then YELLOW = 172;
		elseif (SPELL == 17) then YELLOW = 201;
		elseif (SPELL == 18) then YELLOW = 214;
		elseif (SPELL == 19) then YELLOW = 515;
		elseif (SPELL == 20) then YELLOW = 336;
		elseif (SPELL == 21) then YELLOW = 454;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 4) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 151;
		elseif (SPELL == 2) then YELLOW = 152;
		elseif (SPELL == 3) then YELLOW = 181;
		elseif (SPELL == 4) then YELLOW = 206;
		elseif (SPELL == 5) then YELLOW = 531;
		elseif (SPELL == 6) then YELLOW = 324;
		elseif (SPELL == 7) then YELLOW = 456;
		elseif (SPELL == 8) then YELLOW = 166;
		elseif (SPELL == 9) then YELLOW = 167;
		elseif (SPELL == 10) then YELLOW = 196;
		elseif (SPELL == 11) then YELLOW = 212;
		elseif (SPELL == 12) then YELLOW = 644;
		elseif (SPELL == 13) then YELLOW = 333;
		elseif (SPELL == 14) then YELLOW = 459;
		elseif (SPELL == 15) then YELLOW = 156;
		elseif (SPELL == 16) then YELLOW = 157;
		elseif (SPELL == 17) then YELLOW = 186;
		elseif (SPELL == 18) then YELLOW = 208;
		elseif (SPELL == 19) then YELLOW = 534;
		elseif (SPELL == 20) then YELLOW = 327;
		elseif (SPELL == 21) then YELLOW = 457;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 5) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 166;
		elseif (SPELL == 2) then YELLOW = 167;
		elseif (SPELL == 3) then YELLOW = 196;
		elseif (SPELL == 4) then YELLOW = 212;
		elseif (SPELL == 5) then YELLOW = 644;
		elseif (SPELL == 6) then YELLOW = 333;
		elseif (SPELL == 7) then YELLOW = 459;
		elseif (SPELL == 8) then YELLOW = 29;
		elseif (SPELL == 9) then YELLOW = 30;
		elseif (SPELL == 10) then YELLOW = 39;
		elseif (SPELL == 11) then YELLOW = 21;
		elseif (SPELL == 12) then YELLOW = 112;
		elseif (SPELL == 13) then YELLOW = 565;
		elseif (SPELL == 14) then YELLOW = 461;
		elseif (SPELL == 15) then YELLOW = 151;
		elseif (SPELL == 16) then YELLOW = 152;
		elseif (SPELL == 17) then YELLOW = 181;
		elseif (SPELL == 18) then YELLOW = 206;
		elseif (SPELL == 19) then YELLOW = 531;
		elseif (SPELL == 20) then YELLOW = 324;
		elseif (SPELL == 21) then YELLOW = 456;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 6) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 29;
		elseif (SPELL == 2) then YELLOW = 30;
		elseif (SPELL == 3) then YELLOW = 39;
		elseif (SPELL == 4) then YELLOW = 21;
		elseif (SPELL == 5) then YELLOW = 112;
		elseif (SPELL == 6) then YELLOW = 565;
		elseif (SPELL == 7) then YELLOW = 461;
		elseif (SPELL == 8) then YELLOW = 247;
		elseif (SPELL == 9) then YELLOW = 245;
		elseif (SPELL == 10) then YELLOW = 231;
		elseif (SPELL == 11) then YELLOW = 260;
		elseif (SPELL == 12) then YELLOW = 557;
		elseif (SPELL == 13) then YELLOW = 348;
		elseif (SPELL == 14) then YELLOW = 460;
		elseif (SPELL == 15) then YELLOW = 166;
		elseif (SPELL == 16) then YELLOW = 167;
		elseif (SPELL == 17) then YELLOW = 196;
		elseif (SPELL == 18) then YELLOW = 212;
		elseif (SPELL == 19) then YELLOW = 644;
		elseif (SPELL == 20) then YELLOW = 333;
		elseif (SPELL == 21) then YELLOW = 459;
		end
		target:setVar("YellowTrigger",YELLOW);

	elseif (DayElement == 7) then
		local SPELL = math.random(1,21);
		if (SPELL == 1) then YELLOW = 247;
		elseif (SPELL == 2) then YELLOW = 245;
		elseif (SPELL == 3) then YELLOW = 231;
		elseif (SPELL == 4) then YELLOW = 260;
		elseif (SPELL == 5) then YELLOW = 557;
		elseif (SPELL == 6) then YELLOW = 348;
		elseif (SPELL == 7) then YELLOW = 460;
		elseif (SPELL == 8) then YELLOW = 146;
		elseif (SPELL == 9) then YELLOW = 147;
		elseif (SPELL == 10) then YELLOW = 176;
		elseif (SPELL == 11) then YELLOW = 204;
		elseif (SPELL == 12) then YELLOW = 591;
		elseif (SPELL == 13) then YELLOW = 321;
		elseif (SPELL == 14) then YELLOW = 455;
		elseif (SPELL == 15) then YELLOW = 29;
		elseif (SPELL == 16) then YELLOW = 30;
		elseif (SPELL == 17) then YELLOW = 39;
		elseif (SPELL == 18) then YELLOW = 21;
		elseif (SPELL == 19) then YELLOW = 112;
		elseif (SPELL == 20) then YELLOW = 565;
		elseif (SPELL == 21) then YELLOW = 461;
		end
		target:setVar("YellowTrigger",YELLOW);
	end
end;
-------------------------------------------------
-- Trigger Hints
-------------------------------------------------
function TriggerHintRED(player, target, wsID)
	local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);

	local Zone = player:getZone();
	local RedTrigger = player:getVar("RedTrigger");

	if player:hasKeyItem(1442) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		if (RedTrigger == 34) then
			RedClue = 1;
		elseif (RedTrigger == 51) then
			RedClue = 2;
		elseif (RedTrigger == 20) or (RedTrigger == 148) then
			RedClue = 3;
		elseif (RedTrigger == 178) then
			RedClue = 4;
		elseif (RedTrigger == 114) then
			RedClue = 5;
		elseif (RedTrigger == 149) or (RedTrigger == 161) or (RedTrigger == 37) then
			RedClue = 7;
		elseif (RedTrigger == 22) or (RedTrigger == 133) or (RedTrigger == 98) then
			RedClue = 8;
		end
	    player:messageSpecial(RED_WEAKNESS,RedClue);
	end
end;

function TriggerHintBLUE(player, target, wsID)
	local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);

	local Zone = player:getZone();
	local BlueTrigger = player:getVar("BlueTrigger");

	if player:hasKeyItem(1442) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		if (BlueTrigger == 5) or (BlueTrigger == 6) or (BlueTrigger == 7) or (BlueTrigger == 8) or (BlueTrigger == 9) then
			BlueClue = 1;
		elseif (BlueTrigger == 18) or (BlueTrigger == 23) or (BlueTrigger == 24) or (BlueTrigger == 25) then
			BlueClue = 2;
		elseif (BlueTrigger == 40) or (BlueTrigger == 41) or (BlueTrigger == 42) then
			BlueClue = 3;
		elseif (BlueTrigger == 55) or (BlueTrigger == 56) then
			BlueClue = 4;
		elseif (BlueTrigger == 71) or (BlueTrigger == 72) then
			BlueClue = 5;
		elseif (BlueTrigger == 87) or (BlueTrigger == 88) then
			BlueClue = 6;
		elseif (BlueTrigger == 103) or (BlueTrigger == 104) then
			BlueClue = 7;
		elseif (BlueTrigger == 118) or (BlueTrigger == 119) or (BlueTrigger == 120) then
			BlueClue = 8;
		elseif (BlueTrigger == 135) or (BlueTrigger == 136) then
			BlueClue = 9;
		elseif (BlueTrigger == 151) or (BlueTrigger == 152) then
			BlueClue = 10;
		elseif (BlueTrigger == 165) or (BlueTrigger == 166) or (BlueTrigger == 167) or (BlueTrigger == 168) or (BlueTrigger == 169) then
			BlueClue = 11;
		elseif (BlueTrigger == 176)or (BlueTrigger == 181)  or (BlueTrigger == 182) or (BlueTrigger == 183) or (BlueTrigger == 184) then
			BlueClue = 12;
		elseif (BlueTrigger == 196) or (BlueTrigger == 197) or (BlueTrigger == 198) or (BlueTrigger == 199) then
			BlueClue = 13;
		elseif (BlueTrigger == 212) or (BlueTrigger == 213) or (BlueTrigger == 214) or (BlueTrigger == 215) then
			BlueClue = 14;
		end
		player:messageSpecial(BLUE_WEAKNESS,BlueClue);
	end
end;

function TriggerHintYELLOW(caster)
	local TextIDs = "scripts/zones/" .. caster:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);

	local Zone = caster:getZone();
	local YellowTrigger = caster:getVar("YellowTrigger");
	------------------------------------------------------------------------------------
	-- Hint type: 1 fire, 2 ice, 3 wind, 4 earth, 5 lightning, 6 water, 7 light, 8 dark.
	------------------------------------------------------------------------------------
	if caster:hasKeyItem(1442) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		if (YellowTrigger == 146) or (YellowTrigger == 147) or (YellowTrigger == 176) or (YellowTrigger == 204) or (YellowTrigger == 591)  or (YellowTrigger == 321) or (YellowTrigger == 455) then
			YellowClue = 1;
		elseif (YellowTrigger == 161) or (YellowTrigger == 162) or (YellowTrigger == 191) or (YellowTrigger == 210) or (YellowTrigger == 555)  or (YellowTrigger == 330) or (YellowTrigger == 458) then
			YellowClue = 4;
		elseif (YellowTrigger == 171) or (YellowTrigger == 172) or (YellowTrigger == 201) or (YellowTrigger == 214) or (YellowTrigger == 515)  or (YellowTrigger == 336) or (YellowTrigger == 454) then
			YellowClue = 6;
		elseif (YellowTrigger == 156) or (YellowTrigger == 157) or (YellowTrigger == 186) or (YellowTrigger == 208) or (YellowTrigger == 534)  or (YellowTrigger == 327) or (YellowTrigger == 457) then
			YellowClue = 3;
		elseif (YellowTrigger == 151) or (YellowTrigger == 152) or (YellowTrigger == 181) or (YellowTrigger == 206) or (YellowTrigger == 531)  or (YellowTrigger == 324) or (YellowTrigger == 456) then
			YellowClue = 2;
		elseif (YellowTrigger == 166) or (YellowTrigger == 167) or (YellowTrigger == 196) or (YellowTrigger == 212) or (YellowTrigger == 644)  or (YellowTrigger == 333) or (YellowTrigger == 459) then
			YellowClue = 5;
		elseif (YellowTrigger == 29) or (YellowTrigger == 30) or (YellowTrigger == 39) or (YellowTrigger == 21) or (YellowTrigger == 112)  or (YellowTrigger == 565) or (YellowTrigger == 461) then
			YellowClue = 7;
		elseif (YellowTrigger == 247) or (YellowTrigger == 245) or (YellowTrigger == 231) or (YellowTrigger == 260) or (YellowTrigger == 557)  or (YellowTrigger == 348) or (YellowTrigger == 460) then
			YellowClue = 8;
		end
		caster:messageSpecial(YELLOW_WEAKNESS,YellowClue);
	end
end;
-------------------------------------------------
-- Trigger Execute
-- [0 = Yellow] [1 = blue] [2 = Red] [3 = White]
-------------------------------------------------

function WeaknessTriggerRed(player, target, wsID)
	local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);
	local redproc = player:getVar("RED_PROC");
	local Zone = player:getZone();
	if (redproc == 0) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		target:weaknessTrigger(2);
		target:addStatusEffect(EFFECT_TERROR,0,0,30);
		player:messageSpecial(STAGGERED,0,0,0,0,true);
		player:messageSpecial(RED_STAGGER,0,0,0,0,true);
		player:setVar("RED_PROC",1);
	end
end;

function WeaknessTriggerBlue(player,target,wsID)
	local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);
	local Blueproc = player:getVar("BLUE_PROC");
	local Zone = player:getZone();
	if (Blueproc == 0) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		target:weaknessTrigger(1);
		target:addStatusEffect(EFFECT_AMNESIA,0,0,30);
		player:messageSpecial(STAGGERED,0,0,0,0,true);
		player:messageSpecial(BLUE_STAGGER,0,0,0,0,true);
		player:setVar("BLUE_PROC",1);
	end
end;

function WeaknessTriggerYellow(caster,target,spell)
	local TextIDs = "scripts/zones/" .. caster:getZoneName() .. "/TextIDs";
	package.loaded[TextIDs] = nil;
	require(TextIDs);
	local Yellowproc = caster:getVar("YELLOW_PROC");
	local Zone = caster:getZone();
	if (Yellowproc == 0) and (Zone == 132 or Zone == 15 or Zone == 45 or Zone == 215 or Zone == 216 or Zone == 217 or Zone == 218 or Zone == 253 or Zone == 254 or Zone == 255) then
		target:weaknessTrigger(0);
		target:addStatusEffect(EFFECT_SILENCE,0,0,30);
		caster:messageSpecial(STAGGERED,0,0,0,0,true);
		caster:messageSpecial(YELLOW_STAGGER,0,0,0,0,true);
		caster:setVar("YELLOW_PROC",1);
	end
end;