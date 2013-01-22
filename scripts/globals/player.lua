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
		
	player:addStatusEffect(EFFECT_MANAFONT,1,0,0);		
		
	player:addStatusEffect(EFFECT_REGAIN,100,1,0);
    end
end;

-----------------------------------
-- CharCreate
-----------------------------------

function CharCreate(player)

	local race = player:getRace();

	-- ADD RACE SPECIFIC STARTGEAR
	switch(race) : caseof
	{
		-- HUME MALE
 		[1]	= function (x)
			player:addItem(0x3157);
			player:addItem(0x31D2);
			player:addItem(0x3253);
			player:addItem(0x32CD);
  		end,

		-- HUME FEMALE
  		[2]	= function (x)
			player:addItem(0x3158);
			player:addItem(0x31D8);
			player:addItem(0x3254);
			player:addItem(0x32D2);
  		end,

		-- ELVAAN MALE
  		[3]	= function (x)
			player:addItem(0x3159);
			player:addItem(0x31D3);
			player:addItem(0x3255);
			player:addItem(0x32CE);
  		end,

		-- ELVAAN FEMALE
  		[4]	= function (x)
			player:addItem(0x315A);
			player:addItem(0x31D7);
			player:addItem(0x3259);
			player:addItem(0x32D3);
  		end,

		-- TARU MALE
  		[5]	= function (x)
			player:addItem(0x315B);
			player:addItem(0x31D4);
			player:addItem(0x3256);
			player:addItem(0x32CF);
  		end,

		-- TARU FEMALE
  		[6]	= function (x)
			player:addItem(0x315B);
			player:addItem(0x31D4);
			player:addItem(0x3256);
			player:addItem(0x32CF);
  		end,

		-- MITHRA
  		[7]	= function (x)
			player:addItem(0x315C);
			player:addItem(0x31D5);
			player:addItem(0x3257);
			player:addItem(0x32D0);
  		end,

		-- GALKA
  		[8]	= function (x)
			player:addItem(0x315D);
			player:addItem(0x31D6);
			player:addItem(0x3258);
			player:addItem(0x32D1);
  		end,

  		default = function (x) end,
	}

	-- ADD JOB SPECIFIC STARTGEAR
	switch(player:getMainJob()) : caseof
	{
		-- WARRIOR JOB
		[0x01]= function (x)
			player:addItem(0x4096);
		end,

		-- MONK JOB
		[0x02]= function (x)
 			player:addItem(0x3380);
		end,

		-- WHITE MAGE
		[0x03]= function(x)
			player:addItem(0x42AC);
			player:addItem(0x1200);
		end,

 		-- BLACK MAGE
		[0x04] = function(x)
			player:addItem(0x42D0);
			player:addItem(0x11FF);
		end,

 		-- RED MAGE
	 	[0x05]= function (x)
			player:addItem(0x4062);
			player:addItem(0x11FE);
 		end,

 		-- THIEF
		[0x06]= function (x)
			player:addItem(0x4063);
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

end;