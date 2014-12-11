-------------------------------------------------
--	Author: Ezekyel
--	Logging functions
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Logging
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-------------------------------------------------
-- npcid and drop by zone
-------------------------------------------------

-- Zone, {npcid,npcid,npcid,..}
local npcid = {2,{16785768,16785769,16785770,16785771},				  -- Carpenter's Landing
		 24,{16875845,16875846,16875847,16875848,16875849,16875850},  -- Lufaise Meadows
		 25,{16879961,16879962,16879963,16879964,16879965,16879966},  -- Misareaux Coast
		 65,{17044009,17044010,17044011,17044012,17044013,17044014},  -- Mamook
		 79,{17101310,17101311,17101312,17101313,17101314,17101315},  -- Caedarva Mire
		 81,{17109781,17109782,17109783,17109784,17109785,17109786},  -- East Ronfaure [S]
		 82,{17113900,17113901,17113902,17113903,17113904,17113905},  -- Jugner Forest [S]
		 96,{17171238,17171239,17171240,17171241,17171242,17171243},  -- Fort Karugo-Narugo [S]
		 101,{17191522,17191522,17191524,17191524,17191526,17191527}, -- East Ronfaure
		 104,{17203855,17203856,17203857,17203858,17203859,17203860}, -- Jugner Forest
		 118,{17261166,17261167,17261168,17261169,17261170,17261171}, -- Buburimu Peninsula
		 123,{17281614,17281615,17281616,17281617,17281618,17281619}, -- Yuhtunga Jungle
		 124,{17285666,17285667,17285668,17285669,17285670,17285671}, -- Yhoator Jungle
		 140,{17350969,17350970,17350971,17350972}};				  -- Ghelsba Outpost
-- Zone, {itemid,drop rate,itemid,drop rate,..}
local drop = {2,{0x1198,0.0900,0x02B0,0.1800,0x02BA,0.2700,0x039B,0.3600,0x02B7,0.4500,0x02B5,0.7050,0x02B8,0.9600,0x02BB,1.0000},
		24,{0x02B5,0.0950,0x110B,0.1900,0x02B0,0.4400,0x02B3,0.6900,0x02BA,0.9400,0x02B2,0.9600,0x02BB,0.9800,0x1198,1.0000},
		25,{0x02B0,0.4000,0x02B5,0.4700,0x02B3,0.5400,0x110B,0.7400,0x02BA,0.9400,0x02B2,0.9600,0x02BB,0.9800,0x1198,1.0000},
		65,{0x15BE,0.2300,0x08A5,0.4600,0x02B6,0.5100,0x02BE,0.5600,0x02B1,0.6100,0x02BD,0.6590,0x09C7,0.7660,0x02D7,0.8730,0x02B0,0.9800,0x02D9,1.0000},
		79,{0x02D9,0.0392,0x02B6,0.0944,0x02BE,0.1666,0x02BD,0.2388,0x02B0,0.3590,0x08A5,0.4952,0x02B1,0.6474,0x09C7,0.8156,0x02D7,1.0000},
		81,{0x09E6,0.0030,0x09E4,0.0330,0x02BB,0.0660,0x023E,0.1110,0x02B5,0.1740,0x02B6,0.2640,0x027F,0.3810,0x02BA,0.5130,0x161D,0.6450,0x02B3,0.7950,0x02B0,1.0000},
		82,{0x02B0,0.1800,0x02BA,0.3600,0x02B5,0.5400,0x02B7,0.7200,0x02BB,0.7700,0x09E4,0.8200,0x1198,0.9000,0x161D,0.9800,0x09E6,1.0000},
		96,{0x46FF,0.0040,0x04D4,0.0240,0x034F,0.1630,0x11DA,0.3140,0x161E,0.4810,0x1612,0.7080,0x103A,1.0000},
		101,{0x02B6,0.0500,0x02B8,0.1130,0x023E,0.1760,0x02B6,0.2640,0x02B3,0.4760,0x02B0,0.7380,0x02BA,1.0000},
		104,{0x02BB,0.0120,0x1198,0.0600,0x039B,0.1320,0x02BA,0.2590,0x02B0,0.4220,0x02B7,0.5970,0x02B8,0.7900,0x02B5,1.0000},
		118,{0x02BC,0.0170,0x02BD,0.0430,0x02BE,0.0770,0x023E,0.1290,0x039B,0.2070,0x02B9,0.3020,0x1197,0.4050,0x115D,0.5600,0x02B0,0.7580,0x02B1,1.0000},
		123,{0x02B0,0.2350,0x02D1,0.4650,0x02B1,0.7000,0x02B9,0.7700,0x03AC,0.8400,0x0390,0.9100,0x02BD,0.9400,0x02BE,0.9700,0x04D5,1.0000},
		124,{0x02BE,0.0120,0x02BC,0.0520,0x03AC,0.0920,0x039B,0.1620,0x0390,0.3070,0x02B1,0.4780,0x02B0,0.7290,0x02D1,0.9800,0x04D5,1.0000},
		140,{0x02B9,0.0530,0x02B2,0.1060,0x02B7,0.2050,0x02B3,0.4400,0x02BA,0.6950,0x02B0,1.0000}};

function startLogging(player,zone,npc,trade,csid)
	
	if(trade:hasItemQty(1021,1) and trade:getItemCount() == 1) then
		
		broke = hatchetBreak(player,trade);
		item = getLoggingItem(player,zone);
		
		if(player:getFreeSlotsCount() == 0) then
			full = 1;
		else
			full = 0;
		end
		
		player:startEvent(csid,item,broke,full);
		
		if(item ~= 0 and full == 0) then
			player:addItem(item);
			SetServerVariable("[LOGGING]Zone "..zone,GetServerVariable("[LOGGING]Zone "..zone) + 1);
		end
		
		if(GetServerVariable("[LOGGING]Zone "..zone) >= 3) then
			getNewLoggingPositionNPC(player,npc,zone);
		end
	else
		player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
	end
	
end

function hatchetBreak(player,trade)
	
	--------------------
	-- Determine if Sickle breaks
	--------------------
	
	local broke = 0;
	hatchetbreak = math.random();

	--------------------
	-- Begin Gear Bonus
	--------------------
	
	Body = player:getEquipID(SLOT_BODY);
	Hands = player:getEquipID(SLOT_HANDS);
	Legs = player:getEquipID(SLOT_LEGS);

	if(Body == 14374 or Body == 14375) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	if(Legs == 14297 or Legs == 14298) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	if(Hands == 14817 or Hands == 14818) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	
	--------------------
	-- End Gear Bonus
	--------------------
	
	if(hatchetbreak < LOGGING_BREAK_CHANCE) then
		broke = 1;
		player:tradeComplete();
	end
	
	return broke;
	
end

function getLoggingItem(player,zone)	
	
	Rate = math.random();
	
	for zon = 1, table.getn(drop), 2 do
		if(drop[zon] == zone) then
			for itemlist = 1, table.getn(drop[zon + 1]), 2 do
				if(Rate <= drop[zon + 1][itemlist + 1]) then
					item = drop[zon + 1][itemlist];		
					break;			
				end
			end
			break;
		end
	end
	
	--------------------
	-- Determine chance of no item mined
	-- Default rate is 50%
	--------------------
	
	Rate = math.random();
	
	if(Rate <= (1 - LOGGING_RATE)) then
		item = 0;
	end
	
	return item;
	
end

function getNewLoggingPositionNPC(player,npc,zone)
	
	local newnpcid = npc:getID();
	
	for u = 1, table.getn(npcid), 2 do
		if(npcid[u] == zone) then
			nbNPC = table.getn(npcid[u + 1]);
			while newnpcid == npc:getID() do
				newnpcid = math.random(1,nbNPC);
				newnpcid = npcid[u + 1][newnpcid];
			end
			break;
		end
	end
	
	npc:setStatus(2);
	GetNPCByID(newnpcid):setStatus(0);
	SetServerVariable("[LOGGING]Zone "..zone,0);
	
end