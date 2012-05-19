-----------------------------------
--
--     ConquestGuards
--
-----------------------------------

require("scripts/globals/conquest");
package.loaded["scripts/globals/conquest"] = nil;

nationAlly = 3;

-----------------------------------
-- San d'Oria inventory
-- {Option,CP,Item}
-----------------------------------

SandInv = {0x80A1,0x000A,0x1055,0x80A0,0x0007,0x1056,0x80A3,0x2328,0x3CB5,
           0x80A2,0x09C4,0x3CB6,0x80A5,0x01F4,0x3D91,0x80A6,0x03E8,0x3D92,
           0x80A7,0x07D0,0x3D93,0x8002,0x03E8,0x30DE,0x8003,0x03E8,0x31D1,
           0x8004,0x03E8,0x32CC,0x8006,0x03E8,0x3596,0x8001,0x03E8,0x40A0,
           0x8005,0x03E8,0x4133,0x8000,0x03E8,0x430F,0x8011,0x07D0,0x3156,
           0x8012,0x07D0,0x3252,0x8014,0x07D0,0x32F5,0x8010,0x07D0,0x41D4,
           0x8013,0x07D0,0x43D7,0x8022,0x0FA0,0x308F,0x8023,0x0FA0,0x318F,
           0x8024,0x0FA0,0x328F,0x8021,0x0FA0,0x3330,0x8027,0x0FA0,0x34B7,
           0x8025,0x0FA0,0x4168,0x8020,0x0FA0,0x41CC,0x8026,0x0FA0,0x42FE,
           0x8034,0x1F40,0x3030,0x8031,0x1F40,0x310F,0x8032,0x1F40,0x320F,
           0x8033,0x1F40,0x3597,0x8030,0x1F40,0x40D9,0x8042,0x3E80,0x3018,
           0x8043,0x3E80,0x3019,0x8046,0x3E80,0x318E,0x8047,0x3E80,0x328E,
           0x8045,0x3E80,0x3331,0x8044,0x3E80,0x3333,0x8048,0x3E80,0x33A4,
           0x8049,0x3E80,0x3598,0x8041,0x3E80,0x40BB,0x8040,0x3E80,0x41D3,
           0x8056,0x5DC0,0x3021,0x8052,0x5DC0,0x308E,0x8054,0x5DC0,0x310E,
           0x8055,0x5DC0,0x320E,0x8051,0x5DC0,0x3332,0x8050,0x5DC0,0x350C,
           0x8053,0x5DC0,0x359A,0x8058,0x5DC0,0x40D7,0x8059,0x5DC0,0x41A5,
           0x8057,0x5DC0,0x42AB,0x8062,0x7D00,0x34F5,0x8061,0x7D00,0x41F6,
           0x8060,0x7D00,0x4932,0x8072,0x9C40,0x3354,0x8070,0x9C40,0x36BD,
           0x8071,0x9C40,0x36BE,0x8083,0xBB80,0x41FD,0x8080,0xBB80,0x4239,
           0x8082,0xBB80,0x4432,0x8081,0xBB80,0x460E,0x8090,0xDAC0,0x385C,
           0x80A4,0x1388,0x44AF};

-----------------------------------
-- Bastok inventory
-- {Option,CP,Item}
-----------------------------------

BastInv = {0x80A1,0x000A,0x1055,0x80A0,0x0007,0x1056,0x80A3,0x2328,0x3CB5,
           0x80A2,0x09C4,0x3CB6,0x80A5,0x01F4,0x3D91,0x80A6,0x03E8,0x3D92,
           0x80A7,0x07D0,0x3D93,0x8003,0x03E8,0x30DD,0x8004,0x03E8,0x31D0,
           0x8005,0x03E8,0x32CB,0x8000,0x03E8,0x4031,0x8002,0x03E8,0x4108,
           0x8007,0x03E8,0x418C,0x8006,0x03E8,0x42E8,0x8001,0x03E8,0x4347,
           0x8014,0x07D0,0x3031,0x8011,0x07D0,0x3155,0x8012,0x07D0,0x3251,
           0x8013,0x07D0,0x4169,0x8010,0x07D0,0x4298,0x8022,0x0FA0,0x3096,
           0x8023,0x0FA0,0x3116,0x8024,0x0FA0,0x3196,0x8025,0x0FA0,0x3216,
           0x8026,0x0FA0,0x3296,0x8021,0x0FA0,0x332A,0x8029,0x0FA0,0x34B9,
           0x8028,0x0FA0,0x3606,0x8020,0x0FA0,0x4148,0x8027,0x0FA0,0x41A6,
           0x8031,0x1F40,0x3086,0x8032,0x1F40,0x3186,0x8033,0x1F40,0x3286,
           0x8034,0x1F40,0x3599,0x8030,0x1F40,0x4084,0x8035,0x1F40,0x4383,
           0x8042,0x3E80,0x3106,0x8043,0x3E80,0x3206,0x8041,0x3E80,0x332B,
           0x8040,0x3E80,0x4091,0x8044,0x3E80,0x42E9,0x8045,0x3E80,0x4365,
           0x8053,0x5DC0,0x3010,0x8055,0x5DC0,0x3308,0x8050,0x5DC0,0x332C,
           0x8051,0x5DC0,0x350E,0x8052,0x5DC0,0x40AD,0x8054,0x5DC0,0x42FF,
           0x8062,0x7D00,0x34F6,0x8060,0x7D00,0x3E55,0x8061,0x7D00,0x458F,
           0x8072,0x9C40,0x3355,0x8071,0x9C40,0x3638,0x8070,0x9C40,0x36BF,
           0x8080,0xBB80,0x419F,0x8081,0xBB80,0x4431,0x8083,0xBB80,0x44F7,
           0x8082,0xBB80,0x4714,0x8090,0xDAC0,0x385D,0x80A4,0x1388,0x44B0};

-----------------------------------
-- Windurst inventory
-- {Option,CP,Item}
-----------------------------------

WindInv = {0x80A1,0x000A,0x1055,0x8044,0x3E80,0x31BE,0x8025,0x0FA0,0x32B6,
           0x80A0,0x0007,0x1056,0x8045,0x3E80,0x323E,0x8027,0x0FA0,0x33A5,
           0x80A3,0x2328,0x3CB5,0x8046,0x3E80,0x32BE,0x8028,0x0FA0,0x34B8,
           0x80A2,0x09C4,0x3CB6,0x8041,0x3E80,0x332E,0x8026,0x0FA0,0x416B,
           0x80A5,0x01F4,0x3D91,0x8047,0x3E80,0x41AA,0x8020,0x0FA0,0x4188,
           0x80A6,0x03E8,0x3D92,0x8048,0x3E80,0x4136,0x8033,0x1F40,0x3146,
           0x80A7,0x07D0,0x3D93,0x8040,0x3E80,0x42BA,0x8034,0x1F40,0x31C7,
           0x8003,0x03E8,0x3273,0x8050,0x5DC0,0x332F,0x8035,0x1F40,0x3246,
           0x8002,0x03E8,0x403A,0x8051,0x5DC0,0x350D,0x8036,0x1F40,0x32C6,
           0x8001,0x03E8,0x4284,0x8053,0x5DC0,0x41A8,0x8032,0x1F40,0x332D,
           0x8004,0x03E8,0x42EA,0x8054,0x5DC0,0x41A9,0x8030,0x1F40,0x404F,
           0x8000,0x03E8,0x4307,0x8052,0x5DC0,0x42C6,0x8038,0x1F40,0x411D,
           0x8011,0x07D0,0x30C4,0x8061,0x7D00,0x304B,0x8037,0x1F40,0x41A7,
           0x8012,0x07D0,0x316D,0x8062,0x7D00,0x34F7,0x8031,0x1F40,0x4382,
           0x8013,0x07D0,0x31AF,0x8060,0x7D00,0x3E56,0x8042,0x3E80,0x30BE,
           0x8014,0x07D0,0x3237,0x8072,0x9C40,0x3356,0x8043,0x3E80,0x313E,
           0x8015,0x07D0,0x32AF,0x8070,0x9C40,0x36C0,0x80A4,0x1388,0x44B1,
           0x8016,0x07D0,0x416A,0x8071,0x9C40,0x36C1,0x8024,0x0FA0,0x3236,
           0x8017,0x07D0,0x4222,0x8082,0xBB80,0x4464,0x8090,0xDAC0,0x385E,
           0x8010,0x07D0,0x42CF,0x8081,0xBB80,0x447A,0x8023,0x0FA0,0x31B6,
           0x8021,0x0FA0,0x30B6,0x8083,0xBB80,0x44D1,0x8080,0xBB80,0x46E1,
           0x8022,0x0FA0,0x3136};

-----------------------------------
-- Crystal Donate Array
-- Conquest Point Required for recharged the ring + charge
-- CP Reward for Supply Quest
-- TP Fees
-----------------------------------

DonateCrys = {4096,4097,4098,4099,4100,4101,4102,4103,4238,4239,4240,4241,4242,4243,4244,4245};
XpRing = {350,700,600}; RingCharg = {7,7,3};
supplyReward = {10,30,40,10,40,10,40,40,70,50,60,40,70,70,70,70,70,70};
tpFees = { 0,0,0,0,100, 100, 150, 100, 150, 100, 100, 150, 350, 400, 150, 250, 300, 500, 250, 350, 500, 0, 300 }

----------------------------------------------------------------
-- function getArg1(player)
-----------------------------------------------------------------

function tradeConquestGuard(player,npc,trade,guardnation,guardtype)
	
	-- Nation:	-- SANDORIA, BASTOK, WINDURST, OTHER(Jeuno)
	-- Type: 	1: city, 2: foreign, 3: outpost, 4: border
	
	local myCP = getCP(player);
	local item = trade:getItem();
	local AddPoints = 0;
	
	if(player:getNation() == guardnation or guardnation == OTHER) then
		if(guardtype ~= 3 and guardtype ~= 4) then -- all guard can trade crystal except outpost and border.
			if(item >= 4096 and item <= 4103 or item >= 4238 and item <= 4245) then
				for Crystal = 1,table.getn(DonateCrys),1 do
					local tcount = trade:getItemQty(DonateCrys[Crystal])
					
					if(tcount > 0 and trade:hasItemQty(DonateCrys[Crystal],tcount)) then
						if(player:getRank() == 1) then
							player:showText(npc,CONQUEST - 7);
							break; 
						elseif(player:getRankPoints() == 4000) then
							player:showText(npc,CONQUEST + 43);
							break;
						elseif(DonateCrys[Crystal] == 4102 or DonateCrys[Crystal] == 4103 or DonateCrys[Crystal] == 4244 or DonateCrys[Crystal] == 4245) then
							AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 16));
						else
							AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 12));
						end
					end
				end
					
				if(player:getRank() ~= 1 and player:getRankPoints() < 4000) then
					if(AddPoints + player:getRankPoints() >= 4000) then
						setCP(player,myCP + (AddPoints + player:getRankPoints()) - 4000);
						player:setRankPoints(4000);
						player:showText(npc,CONQUEST + 44);
					else
						--printf("point: %u",AddPoints);
						player:addRankPoints(AddPoints);
						player:showText(npc,CONQUEST + 45);
					end
					player:tradeComplete();
				end
			end
		end
		if(item >= 15761 and item <= 15763) then -- All guard can recharge ring - I can't read number of charge atm
			if(trade:hasItemQty(item,1) and count == 1) then
				if(myCP >= XpRing[item - 15760]) then
					setCP(player,myCP - XpRing[item - 15760]);
					player:tradeComplete();
					player:addItem(item);
					player:messageSpecial(CONQUEST + 58,item,XpRing[item - 15760],RingCharg[(item - 15760)]);
				else
					player:messageSpecial(CONQUEST + 55,item,XpRing[item - 15760]);
				end
			end
		end
	end
	
end;

-------------------------------------------------------------------------
-- function suppliesFresh(player) [NEED COMMAND] 0: delete old supply after weekly conquest tally
-------------------------------------------------------------------------

function supplyRunFresh(player)
	
	local started = player:getVar("supplyQuest_started");
	local region = player:getVar("supplyQuest_region");
	
	if(started + 1 < VanadielDayOfTheYear() and (region > 0 or player:hasKeyItem(75))) then
		return 0;
	else
		return 1;
	end;
	
end;

----------------------------------------------------------------
-- function getArg1(player)
-----------------------------------------------------------------

windurst_bastok_ally = 0;
sandy_windurst_ally = 0;
sandy_bastok_ally = 0;

function getArg1(guardnation,player)
	
	local pNation = player:getNation();
	local output = 0;
	local signet = 0;

	if(guardnation == WINDURST) then
		output = 33;
	elseif(guardnation == SANDORIA) then
		output = 1;
	elseif(guardnation == BASTOK) then
		output = 17;
	end
		
	if(guardnation == pNation) then
		signet = 0;
	elseif(pNation == WINDURST) then
		if(guardnation == BASTOK and windurst_bastok_ally == 1) or (guardnation == SANDORIA and sandy_windurst_ally == 1) then
			signet = 1;
		else
			signet = 7;
		end
	elseif(pNation == BASTOK) then
		if(guardnation == WINDURST and windurst_bastok_ally == 1) or (guardnation == SANDORIA and sandy_bastok_ally == 1) then
			signet = 2;
		else
			signet = 7;
		end
	elseif(pNation == SANDORIA) then
		if(guardnation == WINDURST and sandy_windurst_ally == 1) or (guardnation == BASTOK and sandy_bastok_ally == 1) then
			signet = 4;
		else
			signet = 7;
		end
	end
	
	if(guardnation == OTHER) then
		output = (pNation * 16) + (3 * 256)  + 65537;
	else
		output = output + 256 * signet;
	end
	
	return output;
	
end;

------------------------------------------------
-- function getExForceAvailable(guardnation,player) Expeditionary Force Menu [NOT IMPLEMENTED]
------------------------------------------------

function getExForceAvailable(guardnation,player)
	return 0;
end;

------------------------------------------------
-- function conquest_ranking() computes part of argument 3 for gate guard events.
-- it represents the conquest standing of the 3 nations. Verified.
------------------------------------------------

function conquestRanking()
	return getNationRank(SANDORIA) + 4 * getNationRank(BASTOK) + 16 * getNationRank(WINDURST);
end;

----------------------------------------------------------------
-- function getSupplyAvailable(nation,player) produces the supply quest mask for the nation based on the current conquest standings.
----------------------------------------------------------------

function getSupplyAvailable(nation,player)
	
	local mask = 2130706463;
	
	if(player:getVar("supplyQuest_started") == VanadielDayOfTheYear()) then
		mask = 4294967295; -- Need to wait 1 vanadiel day
	end
	
	for nb = 0,18 do
		if(player:hasKeyItem(getSupplyKey(nb))) then
			mask = -1; -- if you have supply run already activated
		end
	end
	
	if(mask ~= -1 and mask ~= 4294967295) then
		for i = 0,18 do 
			if(GetRegionOwner(i) ~= nation) then
				mask = mask + 2^(i + 5);
			end
		end
	end
	
	return mask;
	
end;

----------------------------------------------------------------
-- function getArg6(player) computes argument 6 for gate guard events. This number encodes a player's rank and nationality:
-- bits 1-4 encode the rank of the player (verified that bit 4 is part of the rank number so ranks could have gone up to 31.)
-- bits 5-6 seem to encode the citizenship as below. This part needs more testing and verification.
-----------------------------------------------------------------

function getArg6(player)
	
	local output = player:getRank();
	local nation = player:getNation();
	
	if(nation == BASTOK) then
		return output + 32;
	elseif(nation == WINDURST) then
		return output + 64;
	end
	
end;

------------------------------------------------
-- function getRewardExForce(guardnation,player) Expeditionary Force Reward [NOT IMPLEMENTED]
------------------------------------------------

function getRewardExForce(guardnation,player)
	return 0;
end;

------------------------------------------------
-- function getKeySupply(region)
------------------------------------------------

function getSupplyKey(region)
	
	if(region <= 9) then
		return 75 + region;
	elseif(region == 10) then
		return 124;
	elseif(region <= 13) then
		return 74 + region;
	elseif(region <= 15) then
		return 248 + region;
	elseif(region == 18) then
		return 620;
	end
	
end;

-----------------------------------------------------------------
-- giltosetHP(player) returns the amount of gil it costs a player to set a homepoint at a foreign outpost/border guard.
-----------------------------------------------------------------

function giltosetHP(guardnation,player)
	
	local rank = player:getRank();
	
	if(getArg1(guardnation,player) < 0x700) then -- determine ifplayer is in same or allied nation as guard 
		HPgil = 0;
	else
		if(rank <= 5) then
			HPgil = 100 * 2^(rank - 1);
		else
			HPgil = 800 * rank - 2400;
		end
	end
	
	return HPgil;
	
end;

-----------------------------------------------------------------
-- function hasOutpost(player, region) returns 1 ifthe player has the outpost of the indicated region under current allegiance.
-----------------------------------------------------------------

function hasOutpost(player, region)
	
	local nation = player:getNation()
	local bit = {};
	
	if(nation == BASTOK) then
		supply_quests = player:getVar("supplyQuest_BASTOK");
	elseif(nation == SANDORIA) then
		supply_quests = player:getVar("supplyQuest_SANDORIA");
	elseif(nation == WINDURST) then
		supply_quests = player:getVar("supplyQuest_WINDURST");
	end;
	
	for i = 23,5,-1 do 
		twop = 2^i
		if(supply_quests >= twop) then
			bit[i]=1;
			supply_quests = supply_quests - twop;
		else
			bit[i]=0;
		end;
	end;
	
	return bit[region];
	
end;

-----------------------------------------------------------------
-- function OP_TeleFee(player,region)
-----------------------------------------------------------------

function OP_TeleFee(player,region)
	
		if(GetRegionOwner(region) == player:getNation()) then
			return tpFees[region + 5];
		else
			return tpFees[region + 5] * 3;
		end
	
end;

-----------------------------------------------------------------
-- Teleport Outpost > Nation
-----------------------------------------------------------------

function toHomeNation(player)
	
	if(player:getNation() == BASTOK) then
		player:setPos(89, 0 , -66, 0, 234); 
	elseif(player:getNation() == SANDORIA) then
		player:setPos(49, -1 , 29, 164, 231); 
	else 
		player:setPos(193, -12 , 220, 64, 240); 
	end
	
end;

-----------------------------------------------------------------
-- function getTeleAvailable(nation)
-----------------------------------------------------------------

function getTeleAvailable(nation)
	
	local mask = 2145386527;
	
	for i = 5,23 do 
		if(GetRegionOwner(i - 5) ~= nation) then
			mask = mask + 2^i;
		end;
	end
	
	return mask;
	
end;

---------------------------------
-- Teleport Nation > Outpost
---------------------------------

function toOutpost(player,option)
	-- Ronfaure
	if(option == 5) then
		player:setPos(-446, -20 , -220, 0, 100); 
	-- Zulkheim
	elseif(option == 6) then
		player:setPos(149, -7 , 94, 154, 103); 
	-- Norvallen
	elseif(option == 7) then
		player:setPos(62, 0 , -1, 67, 104); 
	-- Gustaberg
	elseif(option == 8) then
		player:setPos(-579, 39 , 62, 89, 106); 
	-- Derfland
	elseif(option == 9) then
		player:setPos(465, 24 , 422, 29, 109); 
	-- Sarutabatura
	elseif(option == 10) then
		player:setPos(-15, -13 , 318, 128, 115); 
	-- Kolshushu
	elseif(option == 11) then
		player:setPos(-480, -30 , 57, 62, 118); 
	-- Aragoneu
	elseif(option == 12) then
		player:setPos(-298, 17 , 418, 98, 119); 
	-- Fauregandi
	elseif(option == 13) then
		player:setPos(-18, -59, -108, 100, 111);
	-- Valdeaunia
	elseif(option == 14) then
		player:setPos(210, -23, -206, 160, 112);
	-- Qufim Island
	elseif(option == 15) then
		player:setPos(-246, -20 , 301, 192, 126); 
	-- Lil'Telor
	elseif(option == 16) then
		player:setPos(-38, 0, -140, 69, 121); 
	-- Kuzotz
	elseif(option == 17) then
		player:setPos(-250, 8, -252, 122, 114); 
	-- Vollbow
	elseif(option == 18) then
		player:setPos(-184, 8, -66, 0, 113); 
	-- Elshimo Lowlands
	elseif(option == 19) then
		player:setPos(-243, 0, -400, 192, 123); 
	-- Elshimo Uplands
	elseif(option == 20) then
		player:setPos(203, 0, -82, 36, 124); 
	-- Tulia ?!
	elseif(option == 21) then
		player:setPos(4, -54, -600, 192, 130); 
	-- Tavnazia
	elseif(option == 23) then
		player:setPos(-535, -6, -53, 122, 24); 
	end;
end;

-----------------------------------
-- Expeditionary Force
-- {Option,Quest,Zone,MenuMask,MinimumLevel,KeyItem}
-----------------------------------
EXFORCE = {0x20006,ZULK_EF,0x67,0x000040,0x14,ZULKHEIM_EF_INSIGNIA,
           0x20007,NORV_EF,0x68,0x000080,0x19,NORVALLEN_EF_INSIGNIA,
           0x20009,DERF_EF,0x6D,0x000200,0x19,DERFLAND_EF_INSIGNIA,
           0x2000B,KOLS_EF,0x76,0x000800,0x14,KOLSHUSHU_EF_INSIGNIA,
           0x2000C,ARAG_EF,0x77,0x001000,0x19,ARAGONEU_EF_INSIGNIA,
           0x2000D,FAUR_EF,0x6F,0x002000,0x23,FAUREGANDI_EF_INSIGNIA,
           0x2000E,VALD_EF,0x70,0x004000,0x28,VALDEAUNIA_EF_INSIGNIA,
           0x2000F,QUFI_EF,0x7E,0x008000,0x19,QUFIM_EF_INSIGNIA,
           0x20010,LITE_EF,0x79,0x010000,0x23,LITELOR_EF_INSIGNIA,
           0x20011,KUZO_EF,0x72,0x020000,0x28,KUZOTZ_EF_INSIGNIA,
           0x20012,VOLL_EF,0x71,0x040000,0x41,VOLLBOW_EF_INSIGNIA,
           0x20013,ELLO_EF,0x7B,0x080000,0x23,ELSHIMO_LOWLANDS_EF_INSIGNIA,
           0x20014,ELUP_EF,0x7C,0x100000,0x2D,ELSHIMO_UPLANDS_EF_INSIGNIA};