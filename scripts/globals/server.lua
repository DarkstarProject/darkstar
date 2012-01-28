-----------------------------------
-- Note from Tenjou:
-- now you can customize it a little more in the settings!
-- 
-----------------------------------

require("scripts/globals/mobs");
require("scripts/globals/titles");
require("scripts/globals/conquest");
require("scripts/globals/settings");

-----------------------------------
-- OnServerStart
-----------------------------------

function onServerStart()

	if (EXPLORER_MOOGLE == 1) then
		SetExplorerMoogles();
	end
	SetRegionalConquestOverseers()
	
end;

-----------------------------------
-- CharCreate
-----------------------------------

function CharCreate(player)

	-- ADD RACE SPECIFIC STARTGEAR
	switch(player:getRace()) : caseof
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
		[0x00] = function (x)
			if ((player:getRace() == 0x03) or (player:getRace() == 0x04))
				then player:addItem(0x34B7);
			end;
			player:addKeyItem(0x181);
		end,

 		-- BASTOK CITIZEN
		[0x01] = function (x)
			if (((player:getRace() == 0x01) or (player:getRace() == 0x02) or (player:getRace() == 0x08)))
				then player:addItem(0x34B9);
			end;
			player:addKeyItem(0x182);
		end,

 		-- WINDY CITIZEN
	 	[0x02] = function(x)
			if (((player:getRace() == 0x05) or (player:getRace() == 0x06) or (player:getRace() == 0x07)))
				then player:addItem(0x34B8);
			end;
			player:addKeyItem(0x183);
 		end,

		default = function (x) end,
	}
	
	-- SET START GIL
	player:setGil(START_GIL);

	-- ADD ADVENTURER COUPON
	player:addItem(0x218);

	--SET TITLE
	player:setTitle(NEW_ADVENTURER); 

end;


-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles()

	Moogles  = 
	{
		17723638,	-- Northern_San_d'Oria
		17735847,	-- Bastok_Mines
		17760441,	-- Port_Windurst
		17793123,	-- Selbina
		17797245,	-- Mhaura
	}
	
	i = 1;
	while i <= (table.getn(Moogles)) do	
		npc = GetNPCByID(Moogles[i]);
		npc:setStatus(0);
		i = i + 1;
	end

end;