-----------------------------------
--
-- 	Functions for Conquest system
-- 	
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/missions");

-----------------------------------
-- convenience constants
-----------------------------------

SANDORIA = 0;
  BASTOK = 1;
WINDURST = 2;  
BEASTMEN = 3;
OTHER    = 4;

       RONFAURE = 0;
       ZULKHEIM = 1;
      NORVALLEN = 2;
      GUSTABERG = 3;
       DERFLAND = 4;
   SARUTABARUTA = 5;
      KOLSHUSHU = 6;
       ARAGONEU = 7;
     FAUREGANDI = 8;
     VALDEAUNIA = 9;
    QUFIMISLAND = 10;
        LITELOR = 11;
         KUZOTZ = 12;
        VOLLBOW = 13;
ELSHIMOLOWLANDS = 14;
 ELSHIMOUPLANDS = 15;
          TULIA = 16;
     MOVALPOLOS = 17;
  TAVNAZIANARCH = 18;

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
tpFees = { 100, 100, 150, 100, 150, 100, 100, 150, 350, 400, 150, 250, 300, 500, 250, 350, 500, 0, 300 }

----------------------------------------------------------------
-- function tradeConquestGuard()
-----------------------------------------------------------------

function tradeConquestGuard(player,npc,trade,guardnation,guardtype)
	
	-- Nation:	-- SANDORIA, BASTOK, WINDURST, OTHER(Jeuno)
	-- Type: 	1: city, 2: foreign, 3: outpost, 4: border
	
	local myCP = player:getCP();
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
						newpoint = (AddPoints + player:getRankPoints()) - 4000;
						player:addCP(newpoint);
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
			if(trade:hasItemQty(item,1) and trade:getItemCount() == 1 and player:getVar("CONQUEST_RING_RECHARGE") < os.time() and
            (ALLOW_MULTIPLE_EXP_RINGS == 1 or checkConquestRing(player) < 2)) then
				if(myCP >= XpRing[item - 15760]) then
					
					player:delCP(XpRing[item - 15760]);
					player:tradeComplete();
					player:addItem(item);
					player:setVar("CONQUEST_RING_RECHARGE",getConquestTally());
					player:showText(npc,CONQUEST + 58,item,XpRing[item - 15760],RingCharg[(item - 15760)]);
				else
					player:showText(npc,CONQUEST + 55,item,XpRing[item - 15760]);
				end
         else
            -- TODO: Verify that message is retail correct.
            -- This gives feedback on a failure at least, and is grouped with the recharge messages.  Confident enough for a commit.
            player:showText(npc,CONQUEST+56,item); -- "Please be aware that you can only purchase or recharge <item> once during the period between each conquest results tally.
			end
		end
	end
	
end;

-------------------------------------------------------------------------
-- function suppliesFresh(player) [NEED COMMAND] 0: delete old supply after weekly conquest tally
-------------------------------------------------------------------------

function supplyRunFresh(player)
	
	local fresh = player:getVar("supplyQuest_fresh");
   local started = player:getVar("supplyQuest_started");
	local region = player:getVar("supplyQuest_region");
	
	if((fresh <= os.time() and (region > 0 or player:hasKeyItem(75))) or
      started <= 400) then -- Legacy support to remove supplies from the old system, otherwise they'd never go away.
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
	
	if(player:getVar("supplyQuest_started") == vanaDay()) then
		mask = 4294967295; -- Need to wait 1 vanadiel day
	end
	
	for nb = 0,15 do
		if(player:hasKeyItem(getSupplyKey(nb))) then
			mask = -1; -- if you have supply run already activated
		end
	end
	if(player:hasKeyItem(getSupplyKey(18) then -- we need to skip 16 and 17 for now
		mask = -1;
	end
	
	if(mask ~= -1 and mask ~= 4294967295) then
		for i = 0,18 do 
			if(GetRegionOwner(i) ~= nation or 
			   i == 16 or 
			   (i == 18 and player:hasCompletedMission(COP,SHELTERING_DOUBT) == false)) then
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
	
	if(nation == SANDORIA) then
		return output;
	elseif(nation == BASTOK) then
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
		supply_quests = player:getNationTeleport(BASTOK);
	elseif(nation == SANDORIA) then
		supply_quests = player:getNationTeleport(SANDORIA);
	elseif(nation == WINDURST) then
		supply_quests = player:getNationTeleport(WINDURST);
	end;
	
	for i = 23,5,-1 do 
		twop = 2^i
		if(supply_quests >= twop) then
			bit[i]=1;
			supply_quests = supply_quests - twop;
		else
			bit[i]=0;
		end;
		--printf("bit %u: %u \n",i,bit[i]);
	end;
	
	return bit[region];
	
end;

-----------------------------------------------------------------
-- function OP_TeleFee(player,region)
-----------------------------------------------------------------

function OP_TeleFee(player,region)
		
	if(hasOutpost(player, region+5) == 1) then
		if(GetRegionOwner(region) == player:getNation()) then
			return tpFees[region + 1];
		else
			return tpFees[region + 1] * 3;
		end
	else
		return 0;
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
-- {Option,Quest,Zone,MenuMask,MinimumLevel,KeyItem} NOT USED
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

-----------------------------------
-- Nation rank in conquest
-----------------------------------
	   
function getNationRank(nation)

	local rank = 0;

	if(nation == BASTOK) then
		rank = 1;	
	elseif(nation == SANDORIA) then
		rank = 1;
	elseif(nation == WINDURST) then
		rank = 1;
	end

	return rank;
	
end;

---------------------------------
--
---------------------------------

function getRegionalConquestOverseers(region)

switch (region): caseof {
  ---------------------------------
  [RONFAURE] = function (x) -- West Ronfaure (100)
  ---------------------------------
	--print("RONFAURE");

	npc  = {
	--
		17187487,SANDORIA,	-- Doladepaiton, R.K.
		17187494,SANDORIA,	-- Ballie, R.K.
		17187490,SANDORIA,	-- Flag 
		17187499,SANDORIA,	-- Flag
	--
		17187488,BASTOK,	-- Yoshihiro, I.M.
		17187495,BASTOK,	-- Molting Moth, I.M.
		17187491,BASTOK,	-- Flag 
		17187500,BASTOK,	-- Flag
	--
		17187496,WINDURST,	-- Tottoto, W.W.
		17187489,WINDURST,	-- Kyanta-Pakyanta, W.W.
		17187492,WINDURST,	-- Flag 	
		17187501,WINDURST,	-- Flag
	--
		17187493,BEASTMEN,	-- Flag 
		17187502,BEASTMEN,	-- Flag
	--
		17187497,OTHER,		-- Harvetour
	}	
  end,

  ---------------------------------
  [ZULKHEIM] = function (x) -- Valkurm_Dunes (103)
  ---------------------------------
	--print("ZULKHEIM");

	npc  = {
	-- 
		17199698,SANDORIA,	-- Quanteilleron, R.K.
		17199705,SANDORIA,	-- Prunilla, R.K. 	 
		17199701,SANDORIA,	-- flag
		17199710,SANDORIA,	-- flag
	-- 
		17199699,BASTOK,	-- Tsunashige, I.M.
		17199706,BASTOK,	-- Fighting Ant, I.M. 	
		17199702,BASTOK,	-- flag
		17199711,BASTOK,	-- flag
	-- 
		17199700,WINDURST,	-- Nyata-Mobuta, W.W.
		17199707,WINDURST,	-- Tebubu, W.W. 
		17199703,WINDURST,	-- flag
		17199712,WINDURST,	-- flag
	--
		17199704,BEASTMEN,	-- flag
		17199713,BEASTMEN,	-- flag
		17199718,BEASTMEN,	-- flag
	--	
		17199708,OTHER,		-- Medicine Axe
	}
  end,

  ---------------------------------
  [NORVALLEN] = function (x) -- Jugner_Forest (104)
  ---------------------------------
	--print("NORVALLEN");
	
	npc  = {
	-- 
		17203837,SANDORIA,	-- Chaplion, R.K.
		17203844,SANDORIA,	-- Taumiale, R.K. 
		17203840,SANDORIA,	-- flag
	    17203848,SANDORIA,	-- flag
	-- 
		17203838,BASTOK,	-- Takamoto, I.M.
		17203845,BASTOK,	-- Pure Heart, I.M. 
		17203841,BASTOK,	-- flag
		17203849,BASTOK,	-- flag
	-- 
		17203839,WINDURST,	-- Bubchu-Bibinchu, W.W.
		17203846,WINDURST,	-- Geruru, W.W.  
		17203842,WINDURST,	-- flag
		17203850,WINDURST,	-- flag
	-- 
		17203843,BEASTMEN,	-- flag
	    17203851,BEASTMEN,	-- flag
	    17203862,BEASTMEN,	-- flag
	--
		17203847,OTHER,		-- Mionie
	} 
  end,
  
  ---------------------------------
  [GUSTABERG] = function (x) -- North_Gustaberg (106)
  ---------------------------------
	--print("GUSTABERG");

	npc  = {
	-- 
		17212022,SANDORIA,	-- Ennigreaud, R.K.
		17212029,SANDORIA,	-- Quellebie, R.K.  
		17212025,SANDORIA,	-- flag
	    17212033,SANDORIA,	-- flag
	-- 
		17212023,BASTOK,	-- Shigezane, I.M.
		17212030,BASTOK,	-- Heavy Fog, I.M.  
		17212026,BASTOK,	-- flag
		17212034,BASTOK,	-- flag
	-- 
		17212024,WINDURST,	-- Kuuwari-Aori, W.W.
		17212031,WINDURST,	-- Butsutsu, W.W.
		17212027,WINDURST,	-- flag
		17212035,WINDURST,	-- flag
	-- 
		17212028,BEASTMEN,	-- flag
	    17212036,BEASTMEN,	-- flag
	--
		17212032,OTHER,		-- Kuleo
	}
  end,
  
  ---------------------------------
  [DERFLAND] = function (x) -- Pashhow_Marshlands (109)
  ---------------------------------
	--print("DERFLAND");
  
	npc  = {
	-- 
		17224315,SANDORIA,	-- Mesachedeau, R.K.
		17224322,SANDORIA,	-- Ioupie, R.K. 
		17224318,SANDORIA,	-- flag
		17224326,SANDORIA,	-- flag
	-- 
		17224316,BASTOK,	-- Souun, I.M.
		17224323,BASTOK,	-- Sharp Tooth, I.M. 
		17224319,BASTOK,	-- flag
		17224327,BASTOK,	-- flag
	-- 
		17224317,WINDURST,	-- Mokto-Lankto, W.W.
		17224324,WINDURST,	-- Shikoko, W.W. 
		17224320,WINDURST,	-- flag
		17224328,WINDURST,	-- flag
	-- 
		17224321,BEASTMEN,	-- flag
	    17224329,BEASTMEN,	-- flag
	    17224335,BEASTMEN,	-- flag
	--
		17224325,OTHER,		-- Tahmasp
	}
  end,
  
  ---------------------------------
  [SARUTABARUTA] = function (x) -- West_Sarutabaruta (115)
  ---------------------------------
	--print("SARUTABARUTA");
	
	npc  = {
	-- 
		17248787,SANDORIA,	-- Naguipeillont, R.K.
		17248794,SANDORIA,	-- Banege, R.K. 
		17248790,SANDORIA,	-- flag
		17248798,SANDORIA,	-- flag
	-- 
		17248788,BASTOK,	-- Ryokei, I.M.
		17248795,BASTOK,	-- Slow Axe, I.M.
		17248791,BASTOK,	-- flag
		17248799,BASTOK,	-- flag
	-- 
		17248789,WINDURST,	-- Roshina-Kuleshuna, W.W.
		17248796,WINDURST,	-- Darumomo, W.W. 
		17248792,WINDURST,	-- flag
		17248800,WINDURST,	-- flag
	-- 
		17248793,BEASTMEN,	-- flag
	    17248801,BEASTMEN,	-- flag
	--
		17248797,OTHER,		-- Mahien-Uhien
	}	
  end,
  
  ---------------------------------
  [KOLSHUSHU] = function (x) -- Buburimu_Peninsula (118)
  ---------------------------------
	--print("KOLSHUSHU");

	npc  = {
	-- 
		17261138,SANDORIA,	-- Bonbavour, R.K. 
		17261145,SANDORIA,	-- Craigine, R.K.
		17261141,SANDORIA,	-- flag	
		17261149,SANDORIA,	-- flag
	-- 
		17261139,BASTOK,	-- Ishin, I.M. 
		17261146,BASTOK,	-- Wise Turtle, I.M.
		17261142,BASTOK,	-- flag
		17261151,BASTOK,	-- flag
	-- 
		17261140,WINDURST,	-- Ganemu-Punnemu, W.W.
		17261147,WINDURST,	-- Mashasha, W.W.
		17261143,WINDURST,	-- flag	
		17261151,WINDURST,	-- flag	
	-- 
		17261144,BEASTMEN,	-- flag
		17261152,BEASTMEN,	-- flag
	    17261172,BEASTMEN,	-- flag
	--
		17261148,OTHER,		-- Lobho Ukipturi
	}	
  end,
  
  ---------------------------------
  [ARAGONEU] = function (x) -- Meriphataud_Mountains (119)
  ---------------------------------
	--print("ARAGONEU");

	npc  = {
	-- 
		17265260,SANDORIA,	-- Chegourt, R.K.
		17265267,SANDORIA,	-- Buliame, R.K. 
		17265263,SANDORIA,	-- flag
		17265271,SANDORIA,	-- flag
	-- 
		17265261,BASTOK,	-- Akane, I.M.
		17265268,BASTOK,	-- Three Steps, I.M.  
		17265264,BASTOK,	-- flag
		17265272,BASTOK,	-- flag
	-- 
		17265262,WINDURST,	-- Donmo-Boronmo, W.W.
		17265269,WINDURST,	-- Daruru, W.W. 
		17265265,WINDURST,	-- flag
		17265273,WINDURST,	-- flag
	-- 
		17265266,BEASTMEN,	-- flag
	    17265274,BEASTMEN,	-- flag
	    17265276,BEASTMEN,	-- flag
	--
		17265270,OTHER,		-- Mushosho
	}	
  end,
  
  ---------------------------------
  [FAUREGANDI] = function (x) -- Beaucedine_Glacier (111)
  ---------------------------------
	--print("FAUREGANDI");

	npc  = {
	-- 
		17232198,SANDORIA,	-- Parledaire, R.K.
		17232205,SANDORIA,	-- Leaufetie, R.K. 
		17232201,SANDORIA,	-- flag
		17232209,SANDORIA,	-- flag
	-- 
		17232199,BASTOK,	-- Akane, I.M.
		17232206,BASTOK,	-- Rattling Rain, I.M. 
		17232202,BASTOK,	-- flag
		17232210,BASTOK,	-- flag
	-- 
		17232200,WINDURST,	-- Ryunchi-Pauchi, W.W.
		17232207,WINDURST,	-- Chopapa, W.W. 
		17232203,WINDURST,	-- flag 
		17232211,WINDURST,	-- flag
	-- 
		17232204,BEASTMEN,	-- flag
	    17232212,BEASTMEN,	-- flag
	    17232217,BEASTMEN,	-- flag
	--
		17232208,OTHER,		-- Gueriette
	}	
  end,
  
  ---------------------------------
  [VALDEAUNIA] = function (x) -- Xarcabard (112)
  ---------------------------------
	--print("VALDEAUNIA");

	npc  = {
	-- 
		17236278,SANDORIA,	-- Jeantelas, R.K.
		17236285,SANDORIA,	-- Pilcha, R.K.  
		17236281,SANDORIA,	-- flag
		17236289,SANDORIA,	-- flag
	-- 
		17236279,BASTOK,	-- Kaya, I.M.
		17236286,BASTOK,	-- Heavy Bear, I.M. 
		17236282,BASTOK,	-- flag 
		17236290,BASTOK,	-- flag
	-- 
		17236280,WINDURST,	-- Magumo-Yagimo, W.W.
		17236287,WINDURST,	-- Tememe, W.W. 
		17236283,WINDURST,	-- flag
		17236291,WINDURST,	-- flag
	-- 
		17236284,BEASTMEN,	-- flag
	    17236292,BEASTMEN,	-- flag
	    17236309,BEASTMEN,	-- flag
	--
		17236288,OTHER,		-- Pelogrant
	}	
  end,
  
  ---------------------------------
  [QUFIMISLAND] = function (x) -- Qufim_Island (126)
  ---------------------------------
	--print("QUFIMISLAND");

	npc  = {
	-- 
		17293703,SANDORIA,	-- Pitoire, R.K.
		17293710,SANDORIA,	-- Matica, R.K. 
		17293706,SANDORIA,	-- flag
		17293714,SANDORIA,	-- flag
	-- 
		17293704,BASTOK,	-- Sasa, I.M.
		17293711,BASTOK,	-- Singing Blade, I.M. 
		17293707,BASTOK,	-- flag
		17293715,BASTOK,	-- flag
	--
		17293705,WINDURST,	-- Tsonga-Hoponga, W.W.
		17293712,WINDURST,	-- Numumu, W.W.
		17293708,WINDURST,	-- flag
		17293716,WINDURST,	-- flag
	-- 
		17293709,BEASTMEN,	-- flag
		17293717,BEASTMEN,	-- flag
		17293733,BEASTMEN,	-- flag
	--
		17293713,OTHER,		-- Jiwon
	}
  end,
  
  ---------------------------------
  [LITELOR] = function (x) -- The_Sanctuary_of_ZiTah (121)
  ---------------------------------
	--print("LITELOR");
	
	npc  = {
	-- 
		17273358,SANDORIA,	-- Credaurion, R.K.
		17273365,SANDORIA,	-- Limion, R.K.
		17273361,SANDORIA,	-- flag
		17273369,SANDORIA,	-- flag
	-- 
		17273359,BASTOK,	-- Calliope, I.M.
		17273366,BASTOK,	-- Dedden, I.M. 
		17273362,BASTOK,	-- flag
		17273370,BASTOK,	-- flag
	-- 
		17273360,WINDURST,	-- Ajimo-Majimo, W.W.
		17273367,WINDURST,	-- Ochocho, W.W. 
		17273363,WINDURST,	-- flag
		17273371,WINDURST,	-- flag
	-- 
		17273388,BEASTMEN,	-- flag
		17273372,BEASTMEN,	-- flag
		17273364,BEASTMEN,	-- flag
	--	
		17273368,OTHER,		-- Kasim
	}
  end,
  
  ---------------------------------
  [KUZOTZ] = function (x) -- Eastern_Altepa_Desert (114)
  ---------------------------------
	--print("KUZOTZ");

	npc  = {
	-- 
		17244618,SANDORIA,	-- Eaulevisat, R.K.
		17244625,SANDORIA,	-- Laimeve, R.K.  
		17244621,SANDORIA,	-- flag
		17244629,SANDORIA,	-- flag
	-- 
		17244619,BASTOK,	-- Lindgard, I.M.
		17244626,BASTOK,	-- Daborn, I.M. 
		17244622,BASTOK,	-- flag
		17244630,BASTOK,	-- flag
	-- 
		17244620,WINDURST,	-- Variko-Njariko, W.W.
		17244627,WINDURST,	-- Sahgygy, W.W. 
		17244623,WINDURST,	-- flag
		17244631,WINDURST,	-- flag
	-- 
		17244624,BEASTMEN,	-- flag
		17244632,BEASTMEN,	-- flag
	    17244639,BEASTMEN,	-- flag
	--
		17244628,OTHER,		-- Sowande
	}	
  end,
  
  ---------------------------------
  [VOLLBOW] = function (x) -- Cape_Teriggan (113)
  ---------------------------------
	--print("VOLLBOW");
	
	npc  = {
	-- 
		17240463,SANDORIA,	-- Salimardi, R.K.
		17240470,SANDORIA,	-- Paise, R.K. 
		17240466,SANDORIA,	-- flag
		17240474,SANDORIA,	-- flag
	-- 
		17240464,BASTOK,	-- Sarmistha, I.M.
		17240471,BASTOK,	-- Dultwa, I.M. 
		17240467,BASTOK,	-- flag
		17240475,BASTOK,	-- flag
	-- 
		17240465,WINDURST,	-- Voranbo-Natanbo, W.W.
		17240472,WINDURST,	-- Orukeke, W.W. 
		17240468,WINDURST,	-- flag
		17240476,WINDURST,	-- flag
	-- 
		17240469,BEASTMEN,	-- flag
	    17240477,BEASTMEN,	-- flag 
	    17240487,BEASTMEN,	-- flag
	--
		17240473,OTHER,		-- Bright Moon
	}	
  end,
  
  ---------------------------------
  [ELSHIMOLOWLANDS] = function (x) -- Yuhtunga_Jungle (123)
  ---------------------------------
	--print("ELSHIMOLOWLANDS");

	npc  = {
	-- 
		17281586,SANDORIA,	-- Zorchorevi, R.K.
		17281593,SANDORIA,	-- Mupia, R.K. 
		17281589,SANDORIA,	-- flag
		17281597,SANDORIA,	-- flag
	-- 
		17281587,BASTOK,	-- Mahol, I.M.
		17281594,BASTOK,	-- Bammiro, I.M. 
		17281590,BASTOK,	-- flag
		17281598,BASTOK,	-- flag
	-- 
		17281588,WINDURST,	-- Uphra-Kophra, W.W.
		17281595,WINDURST,	-- Richacha, W.W. 
		17281591,WINDURST,	-- flag
		17281599,WINDURST,	-- flag
	-- 
		17281592,BEASTMEN,	-- flag
		17281600,BEASTMEN,	-- flag
		17281621,BEASTMEN,	-- flag
	--
		17281596,OTHER,		-- Robino-Mobino
	}
  end,
  
  ---------------------------------
  [ELSHIMOUPLANDS] = function (x) -- Yhoator_Jungle (124)
  ---------------------------------
	--print("ELSHIMOUPLANDS");

	npc  ={
	-- 
		17285641,SANDORIA,	-- Ilieumort, R.K.
		17285648,SANDORIA,	-- Emila, R.K. 
		17285644,SANDORIA,	-- flag
		17285652,SANDORIA,	-- flag
	-- 
		17285642,BASTOK,	-- Mintoo, I.M.
		17285649,BASTOK,	-- Guddal, I.M.  
		17285645,BASTOK,	-- flag
		17285653,BASTOK,	-- flag
	-- 
		17285643,WINDURST,	-- Etaj-Pohtaj, W.W.
		17285650,WINDURST,	-- Ghantata, W.W. 
		17285646,WINDURST,	-- flag
		17285654,WINDURST,	-- flag
	-- 
		17285647,BEASTMEN,	-- flag
		17285655,BEASTMEN,	-- flag
		17285672,BEASTMEN,	-- flag
	--
		17285651,OTHER,		-- Mugha Dovajaiho
	}
  end,
  
  ---------------------------------
  [TULIA] = function (x) -- RuAun_Gardens (130)
  ---------------------------------
	--print("TULIA");

	npc  = {
	-- 
		17310073,SANDORIA,	-- flag
	-- 
		17310074,BASTOK,	-- flag
	-- 
		17310075,WINDURST,	-- flag
	-- 
		17310076,BEASTMEN,	-- flag
	}
  end,
  
  ---------------------------------
  [MOVALPOLOS] = function (x) -- Oldton_Movalpolos
  ---------------------------------
	--print("MOVALPOLOS");
	
	npc  = {
	-- 
		16822506,SANDORIA,	-- flag
	-- 
		16822507,BASTOK,	-- flag
	-- 
		16822508,WINDURST,	-- flag
	-- 
		16822509,BEASTMEN,	-- flag
	}		
  end,
  
  ---------------------------------
  [TAVNAZIANARCH] = function (x) -- Lufaise_Meadows
  ---------------------------------
	--print("TAVNAZIA");
	
	npc  = {
	-- 
		16875825,SANDORIA,	-- Jemmoquel, R.K.
		16875832,SANDORIA,	-- Chilaumme, R.K.
		16875828,SANDORIA,	-- flag
		16875836,SANDORIA,	-- flag
	-- 
		16875826,BASTOK,	-- Yoram, I.M.
		16875833,BASTOK,	-- Ghost Talker, I.M. 
		16875829,BASTOK,	-- flag
		16875837,BASTOK,	-- flag
	-- 
		16875827,WINDURST,	-- Teldo-Moroldo, W.W.
		16875834,WINDURST,	-- Cotete, W.W.
		16875830,WINDURST,	-- flag		
		16875838,WINDURST,	-- flag
	-- 
		16875831,BEASTMEN,	-- flag
        16875839,BEASTMEN,	-- flag
	--
		16875835,OTHER,		-- Jersey
	}
  end,
  } 

 return npc;
end;

-----------------------------------
--
-----------------------------------

function SetRegionalConquestOverseers()
	
	for region = 0, 18 do
		local npclist = getRegionalConquestOverseers(region);
		local nation  = GetRegionOwner(region);
		
		for i = 1, table.getn(npclist), 2 do
			if(npclist[i+1] == nation) then
				GetNPCByID(npclist[i]):setStatus(0);
			else
				GetNPCByID(npclist[i]):setStatus(2);
			end
		
			if(npclist[i+1] == OTHER) then
				if(nation ~= BEASTMEN) then
					GetNPCByID(npclist[i]):setStatus(0);
				else
					GetNPCByID(npclist[i]):setStatus(2);
				end
			end
		end;	
	end;
	
end;

-----------------------------------
-- checkConquestRing
-----------------------------------

function checkConquestRing(player)
   local count = 0;

   -- If not enabled by admin, do a count on Chariot, Empress, and Emperor Band
   if (ALLOW_MULTIPLE_EXP_RINGS ~= 1) then
      for i=15761,15763 do
         if (player:hasItem(i) == true) then
            count = count + 1;
         end
      end
   end

   -- One exp ring purchasable per conquest tally
   if (BYPASS_EXP_RING_ONE_PER_WEEK ~= 1 and player:getVar("CONQUEST_RING_TIMER") > os.time()) then
      count = 3;
   end

   return count;
end;