-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/status");
require("scripts/globals/titles");

-----------------------------------
-- onGameIn
-----------------------------------

function onGameIn(player, firstlogin)
    if (firstlogin) then
        CharCreate(player);
    end;



    if (player:getVar("GodMode") == 1) then
	player:addStatusEffect(EFFECT_SENTINEL,-100,0,0);
	player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,0);
	player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);
	player:addStatusEffect(EFFECT_CHAINSPELL,1,0,0);
	player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
	player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
	player:addStatusEffect(EFFECT_MANAFONT,1,0,0);
	player:addStatusEffect(EFFECT_REGAIN,100,1,0);
    end
end;

-----------------------------------
-- CharCreate
-----------------------------------

function CharCreate(player)

	local race = player:getRace();
	local body = nil;
	local leg = nil;
	local hand = nil;
	local feet = nil;

	-- ADD RACE SPECIFIC STARTGEAR
	switch(race) : caseof
	{
		-- HUME MALE
 		[1]	= function (x)
	 		body = 0x3157;
	 		hand = 0x31D2;
	 		leg = 0x3253;
			feet = 0x32CD;
  		end,

		-- HUME FEMALE
  		[2]	= function (x)
	  		body = 0x3158;
	  		hand = 0x31D8;
	  		leg = 0x3254;
	  		feet = 0x32D2;
  		end,

		-- ELVAAN MALE
  		[3]	= function (x)
	  		body = 0x3159;
	  		hand = 0x31D3;
	  		leg = 0x3255;
	  		feet = 0x32CE;
  		end,

		-- ELVAAN FEMALE
  		[4]	= function (x)
			body = 0x315A;
			hand = 0x31D7;
			leg = 0x3259;
			feet = 0x32D3;
  		end,

		-- TARU MALE
  		[5]	= function (x)
			body = 0x315B;
			hand = 0x31D4;
			leg = 0x3256;
			feet = 0x32CF;
  		end,

		-- TARU FEMALE
  		[6]	= function (x)
			body = 0x315B;
			hand = 0x31D4;
			leg = 0x3256;
			feet = 0x32CF;
  		end,

		-- MITHRA
  		[7]	= function (x)
			body = 0x315C;
			hand = 0x31D5;
			leg = 0x3257;
			feet = 0x32D0;
  		end,

		-- GALKA
  		[8]	= function (x)
			body = 0x315D;
			hand = 0x31D6;
			leg = 0x3258;
			feet = 0x32D1;
  		end,

  		default = function (x) end,
	}

	-- Add starting gear
	if not(player:hasItem(body)) then
		player:addItem(body);
		player:equipItem(body);
	end

	if not(player:hasItem(hand)) then
		player:addItem(hand);
		player:equipItem(hand);
	end

	if not(player:hasItem(leg)) then
		player:addItem(leg);
		player:equipItem(leg);
	end

	if not(player:hasItem(feet)) then
		player:addItem(feet);
		player:equipItem(feet);
	end

	-- ADD JOB SPECIFIC STARTGEAR
	switch(player:getMainJob()) : caseof
	{
		-- WARRIOR JOB
		[0x01]= function (x)
			if not(player:hasItem(0x4096)) then
				player:addItem(0x4096);
			end
		end,

		-- MONK JOB
		[0x02]= function (x)
			if not(player:hasItem(0x3380)) then
	 			player:addItem(0x3380);
	 		end
		end,

		-- WHITE MAGE
		[0x03]= function(x)
			if not(player:hasItem(0x42AC)) then
				player:addItem(0x42AC);
			end

			if not(player:hasItem(0x1200)) then
			player:addItem(0x1200);
			end
		end,

 		-- BLACK MAGE
		[0x04] = function(x)

			if not(player:hasItem(0x42D0)) then
				player:addItem(0x42D0);
			end

			if not(player:hasItem(0x11FF)) then
				player:addItem(0x11FF);
			end
		end,

 		-- RED MAGE
	 	[0x05]= function (x)
			if not(player:hasItem(0x4062)) then
				player:addItem(0x4062);
			end
			if not(player:hasItem(0x11FE)) then
				player:addItem(0x11FE);
			end
 		end,

 		-- THIEF
		[0x06]= function (x)
			if not(player:hasItem(0x4063)) then
				player:addItem(0x4063);
			end
 		end,

 		default = function (x) end,
	}

	-- ADD NATION SPECIFIC STARTGEAR
 	switch (player:getNation()) : caseof
	{
 		-- SANDY CITIZEN
		[0] = function (x)
			if ((race == 3) or (race == 4))
				then player:addItem(0x34B7);
			end;
			player:addKeyItem(MAP_OF_THE_SANDORIA_AREA);
		end,

 		-- BASTOK CITIZEN
		[1] = function (x)
			if (((race == 1) or (race == 2) or (race == 8)))
				then player:addItem(0x34B9);
			end;
			player:addKeyItem(MAP_OF_THE_BASTOK_AREA);
		end,

 		-- WINDY CITIZEN
	 	[2] = function(x)
			if (((race == 5) or (race == 6) or (race == 7)))
				then player:addItem(0x34B8);
			end;
			player:addKeyItem(MAP_OF_THE_WINDURST_AREA);
 		end,

		default = function (x) end,
	}

	-- SET START GIL
	player:setGil(START_GIL);

	-- ADD ADVENTURER COUPON
	player:addItem(0x218);

	-- START AHT URHGAN MISSION 1
	player:addMission(4,0);

	--SET TITLE
	player:addTitle(NEW_ADVENTURER);

	-- Needs Moghouse Intro
	player:setVar("MoghouseExplication",1);

end;