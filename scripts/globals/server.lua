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
    if (FIELD_MANUALS == 1) then
        SetFieldManual();
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
	player:addTitle(NEW_ADVENTURER); 

end;


-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles()

	local Moogles  = 
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

-----------------------------------
-- SetFieldManual
----------------------------------

function SetFieldManual()

	local FieldManuals  = 
	{
        17187512,17187513,17191494,17191495,
        17195671,17195672,17199745,17199746,
        17199747,17203877,17203878,17207859,
        17207860,17212073,17212074,17212075,
        17216141,17216142,17220159,17220160,
        17224345,17224346,17228369,17228370,
        17232270,17232271,17232272,17232273,
        17236337,17236338,17240507,17240508,
        17244645,17244646,17244647,17248815,
        17248816,17248817,17253023,17253024,
        17253025,17257068,17257069,17257070,
        17261192,17261193,17265285,17265286,
        17265287,17269247,17269248,17273411,
        17273412,17277203,17277204,17281640,
        17281641,17281642,17281643,17285690,
        17285691,17285692,17289789,17289790,
        17289791,17293769,17293770,17297484,
        17301585,17301586,17310097,17310098,
        17310099,17310100,17310101,17310102,
	}
	
	i = 1;
	while i <= (table.getn(FieldManuals)) do	
		npc = GetNPCByID(FieldManuals[i]);
		npc:setStatus(0);
		i = i + 1;
	end

end;