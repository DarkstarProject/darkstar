require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");

-- NEW SYSTEM BCNM NOTES
-- The "core" functions TradeBCNM EventUpdateBCNM EventTriggerBCNM EventFinishBCNM all return TRUE if the action performed is covered by the function. 
-- This means all the old code will still be executed if the new functions don't support it. This means that there is effectively 'backwards compatibility' with the old system.

-- array to map (for each zone) the item id of the valid trade item with the bcnmid in the database
-- e.g. zone,{itemid,bcnmid,itemid,bcnmid,itemid,bcnmid} 
-- DO NOT INCLUDE MAAT FIGHTS
itemid_bcnmid_map = {10,{0,0},--The_Shrouded_Maw
                     17,{0,0},--spire of holla
					 19,{0,0},--spire of dem
					 21,{0,0},--spire of mea
					 23,{0,0},--Spire_of_Vahzl
					 31,{0,0},--Monarch Linn
					 139,{1553,11,1175,15,1180,17}, -- Horlais Peak
					 140,{1551,34,1552,35,1552,36}, -- Ghelsba Outpost
					 144,{1166,68,1178,81,1553,76,1180,82,1130,79}, -- Waughroon Shrine
					 146,{1553,107,1551,105}, -- Balgas Dias
					 168,{0,0}, -- Chamber of Oracles
					 170,{0,0}, -- Full Moon Fountain
					 180,{1550,293}, -- LaLoff Amphitheater
					 201,{1546,418,1174,417}, -- Cloister of Gales
					 202,{1548,450,1172,449}, -- Cloister of Storms
					 203,{1545,482,1171,481}, -- Cloister of Frost
					 206,{0,0}, -- Qu'Bia Arena
					 207,{1544,545}, -- Cloister of Flames
					 209,{1547,578,1169,577}, -- Cloister of Tremors
					 211,{1549,609}}; -- Cloister of Tides
					 
-- array to map (for each zone) the BCNM ID to the Event Parameter corresponding to this ID.
-- DO NOT INCLUDE MAAT FIGHTS (only included one for testing!)
-- bcnmid,paramid,bcnmid,paramid,etc
-- The BCNMID is found via the database.
-- The paramid is a bitmask which you need to find out. Being a bitmask, it will be one of:
-- 0,1,2,3,4,5,...
bcnmid_param_map = {10,{704,0,706,2},
                    17,{768,0},
					19,{800,0},
					21,{832,0},
                    23,{864,0},
					31,{960,0,961,1},
					139,{0,0,5,5,6,6,7,7,11,11,15,15,17,17},
					140,{32,0,33,1,34,2,35,3,36,4},
					144,{64,0,67,3,68,4,70,6,71,7,72,8,81,17,76,12,82,18,79,15},
					146,{96,0,101,5,102,6,103,7,107,11,105,9},
					163,{128,0},
					165,{160,0},
					168,{192,0,194,2,195,3,196,4},
					170,{224,0},
					179,{256,0},
					180,{293,5,288,0,289,1,290,2,291,3,292,4},
					201,{416,0,417,1,418,2},
					202,{448,0,449,1,450,2},
					203,{480,0,481,1,482,2},
					206,{512,0,517,5,518,6,519,7}, 
					207,{544,0,545,1},
					209,{576,0,577,1,578,2},
					211,{608,0,609,1}};

-- Call this onTrade for burning circles
function TradeBCNM(player,zone,trade,npc)
	-- return false;
	if(player:hasStatusEffect(EFFECT_BATTLEFIELD))then --cant start a new bc
		player:messageBasic(94,0,0);
		return false;
	elseif(player:hasWornItem(trade:getItem())) then -- If already used orb or testimony
		player:messageBasic(56,0,0); -- i need correct dialog
		return false;
	end
	
	if(CheckMaatFights(player,zone,trade,npc))then --This function returns true for maat fights
		return true;
	end
	--the following is for orb battles, etc

	local id = ItemToBCNMID(player,zone,trade);
	
	if(id == -1)then --no valid BCNMs with this item
		--todo: display message based on zone text offset
		player:setVar("trade_bcnmid",0);
		player:setVar("trade_itemid",0);
		return false;
	else --a valid BCNM with this item, start it.
		local mask = GetBattleBitmask(id,zone,1);
		
		if(mask == -1)then --Cannot resolve this BCNMID to an event number, edit bcnmid_param_map!
			print("Item is for a valid BCNM but cannot find the event parameter to display to client.");
			player:setVar("trade_bcnmid",0);
			player:setVar("trade_itemid",0);
			return false;
		end
		if(player:isBcnmsFull() == 1)then --temp measure, this will precheck the instances
			print("all bcnm instances are currently occupied.");
			npc:messageBasic(246,0,0); --this wont look right in other languages!
			return true;
		end
		player:startEvent(0x7d00,0,0,0,mask,0,0,0,0);
		return true;
	end
end;

function EventTriggerBCNM(player,npc)
	player:setVar("trade_bcnmid",0);
	player:setVar("trade_itemid",0);
	
	if(player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
		if(player:isInBcnm() == 1) then
			player:startEvent(0x7d03); --Run Away or Stay menu
		else --You're not in the BCNM but you have the Battlefield effect. Think: non-trader in a party
			status = player:getStatusEffect(EFFECT_BATTLEFIELD);
			local playerbcnmid = status:getPower();
			local playermask = GetBattleBitmask(playerbcnmid,player:getZone(),1);
			if(playermask~=-1) then
				--This gives players who did not trade to go in the option of entering the fight
				player:startEvent(0x7d00,0,0,0,playermask,0,0,0,0);
			else
				player:messageBasic(94,0,0);
			end
		end
		return true;
	else
		if(checkNonTradeBCNM(player,npc)) then
			return true;
		end
	end
	
	return false;
end;

function EventUpdateBCNM(player,csid,option)
	-- return false;
	local id = player:getVar("trade_bcnmid"); --this is 0 if the bcnm isnt handled by new functions
	
	print("UPDATE csid "..csid.." option "..option);
	--seen: option 2,3,0 in that order
	if(csid == 0x7d03 and option == 2)then --leaving a BCNM the player is currently in.
		player:bcnmLeave(1);
		return true;
	end
	if(option == 255 and csid == 0x7d00)then --Clicked yes, try to register bcnmid
		if(player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
			--You're entering a bcnm but you already had the battlefield effect, so you want to go to the
			--instance that your battlefield effect represents.
			player:setVar("bcnm_instanceid_tick",0);
			player:setVar("bcnm_instanceid",player:getInstanceID()); --returns 255 if non-existent.
			return true;
		end
		
		local inst = player:bcnmRegister(id);
		if(inst > 0)then
			player:setVar("bcnm_instanceid",inst);
			player:setVar("bcnm_instanceid_tick",0);
			player:updateEvent(0,3,0,0,1,0);
			--player:tradeComplete();
		else 
			--no free battlefields at the moment!
			print("no free instances");
			player:setVar("bcnm_instanceid",255);
			player:setVar("bcnm_instanceid_tick",0);
		end
	elseif(option == 0 and csid == 0x7d00)then --Requesting an Instance
		-- Increment the instance ticker.
		-- The client will send a total of THREE EventUpdate packets for each one of the free instances.
		-- If the first instance is free, it should respond to the first packet
		-- If the second instance is free, it should respond to the second packet, etc
		local instance = player:getVar("bcnm_instanceid_tick");
		instance = instance + 1;
		player:setVar("bcnm_instanceid_tick",instance);
		
		if(instance == player:getVar("bcnm_instanceid"))then
			--respond to this packet
			local mask = GetBattleBitmask(id,player:getZone(),2);
			player:updateEvent(2,mask,0,1,1,0); -- Add mask number for the correct entering CS
			player:bcnmEnter(id);
			player:setVar("bcnm_instanceid_tick",0);
		elseif(player:getVar("bcnm_instanceid") == 255)then --none free
			--print("nfa");
			--player:updateEvent(2,5,0,0,1,0);
			--param1
			--2=generic enter cs
			--3=spam increment instance requests
			--4=cleared to enter but cant while ppl engaged
			--5=dont meet req, access denied.
			--6=room max cap
			--param2 alters the eventfinish option (offset)
			--param7/8 = does nothing??
		end
		--@pos -517 159 -209
		--@pos -316 112 -103
		--player:updateEvent(msgid,bcnmFight,0,record,numadventurers,skip); skip=1 to skip anim
		--msgid 1=wait a little longer, 2=enters
	end
	
	return true;
end;

function EventFinishBCNM(player,csid,option)
	print("FINISH csid "..csid.." option "..option);
	
	if(player:hasStatusEffect(EFFECT_BATTLEFIELD) == false) then -- Temp condition for normal bcnm (started with onTrigger)
		return false;
	else
		local id = player:getVar("trade_bcnmid");
		local item = player:getVar("trade_itemid");
		
		if(id == 68 or id == 418 or id == 450 or id == 482 or id == 545 or id == 578 or id == 609 or id == 293) then
			player:tradeComplete(); -- Removes the item
		elseif((item >= 1426 and item <= 1440) or item == 1130 or item == 1131 or item == 1175 or item == 1177 or item == 1180 or item == 1178 or item == 1551 or item == 1552 or item == 1553) then -- Orb and Testimony (one time item)
			player:createWornItem(item);
		end
		return true;
	end
	
end;

--Returns TRUE if you're trying to do a maat fight, regardless of outcome e.g. if you trade testimony on wrong job, this will return true in order to prevent further execution of TradeBCNM. Returns FALSE if you're not doing a maat fight (in other words, not trading a testimony!!)
function CheckMaatFights(player,zone,trade,npc)
	player:setVar("trade_bcnmid",0);
	player:setVar("trade_itemid",0);
	--check for maat fights (one maat fight per zone in the db, but >1 mask entries depending on job, so we
	--need to choose the right one depending on the players job, and make sure the right testimony is traded,
	--and make sure the level is right!
	local itemid = trade:getItem();
	local job = player:getMainJob();
	local lvl = player:getMainLvl();
	
	if(itemid >= 1426 and itemid <= 1440) then --The traded item IS A TESTIMONY
		if(lvl < 66 or player:getVar("maatDefeated") > 0)then --not high enough level for maat fight :( or maat already defeated
			return true;
		end
		
		if(player:isBcnmsFull() == 1)then --temp measure, this will precheck the instances
			print("all bcnm instances are currently occupied.");
			npc:messageBasic(246,0,0);
			return true;
		end
		
		--Zone,{item,job,menu,bcnmid,...}
		maatList = {139,{1426,1,32,5,1429,4,64,6,1436,11,128,7},		-- Horlais Peak [WAR BLM RNG]
					144,{1430,5,64,70,1431,6,128,71,1434,9,256,72},		-- Waughroon Shrine [RDM THF BST]
					146,{1427,2,32,101,1428,3,64,102,1440,15,128,103},	-- Balga's Dais [MNK WHM SMN]
					168,{1437,12,4,194,1438,13,8,195,1439,14,16,196},	-- Chamber of Oracles [SAM NIN DRG]
					206,{1432,7,32,517,1433,8,64,518,1435,10,128,519} };-- Qu'Bia Arena [PLD DRK BRD]
		
		for nb = 1, table.getn(maatList), 2 do
			if(maatList[nb] == zone) then
				for nbi = 1, table.getn(maatList[nb + 1]), 4 do
					if(itemid == maatList[nb + 1][nbi] and job == maatList[nb + 1][nbi + 1]) then
						player:startEvent(0x7d00,0,0,0,maatList[nb + 1][nbi + 2],0,0,0,0);
						player:setVar("trade_bcnmid",maatList[nb + 1][nbi + 3]);
						player:setVar("trade_itemid",maatList[nb + 1][nbi]);
						break;
					end
				end
			end
		end
		
		return true;
	end
	--if it got this far then its not a testimony
	return false;
end;

function GetBattleBitmask(id,zone,mode)
	--normal sweep for NON MAAT FIGHTS
	for zoneindex = 1, table.getn(bcnmid_param_map), 2 do
		if(zone==bcnmid_param_map[zoneindex])then --matched zone
			for bcnmindex = 1, table.getn(bcnmid_param_map[zoneindex + 1]), 2 do --loop bcnms in this zone
				if(id==bcnmid_param_map[zoneindex+1][bcnmindex])then --found bcnmid
					if(mode == 1) then
						return 2^bcnmid_param_map[zoneindex+1][bcnmindex+1]; -- for trigger (mode 1): 1,2,4,8,16,32,...
					else
						return bcnmid_param_map[zoneindex+1][bcnmindex+1]; -- for update (mode 2): 0,1,2,3,4,5,6,...
					end
				end
			end
		end
	end
	return -1;
end;

function ItemToBCNMID(player,zone,trade)
	for zoneindex = 1, table.getn(itemid_bcnmid_map), 2 do
		if(zone==itemid_bcnmid_map[zoneindex])then --matched zone
			for bcnmindex = 1, table.getn(itemid_bcnmid_map[zoneindex + 1]), 2 do --loop bcnms in this zone
				if(trade:getItem()==itemid_bcnmid_map[zoneindex+1][bcnmindex])then
					local item = trade:getItem();
					local questTimelineOK = 0;
					
					-- Job/lvl condition for smn battle lvl20
					if(item >= 1544 and item <= 1549 and player:getMainJob() == 15 and player:getMainLvl() >= 20) then 
						questTimelineOK = 1;
					elseif(item == 1166 and player:getVar("aThiefinNorgCS") == 6) then -- AF3 SAM condition
						questTimelineOK = 1;
					elseif(item == 1551) then -- BCNM20 
						questTimelineOK = 1;
					elseif(item == 1552) then -- BCNM30
						questTimelineOK = 1;
					elseif(item == 1131) then -- BCNM40
						questTimelineOK = 1;
					elseif(item == 1130) then -- BCNM60
						questTimelineOK = 1;
					elseif(item == 1175) then -- KSNM30
						questTimelineOK = 1;
					elseif(item == 1178) then -- KSNM30
						questTimelineOK = 1;
					elseif(item == 1180) then -- KSNM30
						questTimelineOK = 1;
					elseif(item == 1553) then -- KSNM99
						questTimelineOK = 1;
					elseif(item == 1550 and (player:getQuestStatus(OUTLANDS,DIVINE_MIGHT) == QUEST_ACCEPTED or player:getQuestStatus(OUTLANDS,DIVINE_MIGHT_REPEAT) == QUEST_ACCEPTED)) then -- Divine Might
						questTimelineOK = 1;
					elseif(item == 1169 and player:getVar("ThePuppetMasterProgress") == 2) then -- The Puppet Master
						questTimelineOK = 1;
					elseif(item == 1171 and player:getVar("ClassReunionProgress") == 5) then -- Class Reunion
						questTimelineOK = 1;
					elseif(item == 1172 and player:getVar("CarbuncleDebacleProgress") == 3) then -- Carbuncle Debacle (Gremlims)
						questTimelineOK = 1;
					elseif(item == 1174 and player:getVar("CarbuncleDebacleProgress") == 6) then -- Carbuncle Debacle (Ogmios)
						questTimelineOK = 1;
					end
					
					if(questTimelineOK == 1) then
						player:setVar("trade_bcnmid",itemid_bcnmid_map[zoneindex+1][bcnmindex+1]);
						player:setVar("trade_itemid",itemid_bcnmid_map[zoneindex+1][bcnmindex]);
						return itemid_bcnmid_map[zoneindex+1][bcnmindex+1];
					end
			
				end
			end
		end
	end
	return -1;
end;

-- E.g. mission checks go here, you must know the right bcnmid for the mission you want to code.
--      You also need to know the bitmask (event param) which should be put in bcnmid_param_map
function checkNonTradeBCNM(player,npc)
	
	local mask = 0;
	local Zone = player:getZone();
	
	if(Zone == 10) then--The_Shrouded_Maw
	    if(player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 2) then--DARKNESS_NAMED
	         mask = GetBattleBitmask(704,Zone,1);   
	         player:setVar("trade_bcnmid",704);
		elseif(player:hasKeyItem(VIAL_OF_DREAM_INCENSE)==true)then --waking_dreams (diabolos avatar quest)
			 mask = GetBattleBitmask(706,Zone,1);   
	         player:setVar("trade_bcnmid",706);
	    end	
	elseif(Zone == 17) then --Spire of Holla
	    if(player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_HOLLA) == false) then -- light of holla
	        mask = GetBattleBitmask(768,Zone,1);
	        player:setVar("trade_bcnmid",768);
	    end
	elseif(Zone == 19) then --Spire of Dem
	    if(player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_DEM) == false) then -- light of dem
	        mask = GetBattleBitmask(800,Zone,1);
	        player:setVar("trade_bcnmid",800);
	    end	
	elseif(Zone == 21) then --Spire of Mea
	    if(player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_MEA) == false) then -- light of mea
	        mask = GetBattleBitmask(832,Zone,1);
	        player:setVar("trade_bcnmid",832);
	    end
	elseif(Zone == 23) then --Spire of vahzl
	    if(player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==8) then -- desires of emptiness
	        mask = GetBattleBitmask(864,Zone,1);
	        player:setVar("trade_bcnmid",864);
	    end	
	elseif(Zone == 31) then --Monarch Linn
	    if(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then  -- Ancient Vows bcnm
	      	mask = GetBattleBitmask(960,Zone,1);
	        player:setVar("trade_bcnmid",960);
		elseif(player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 1) then
	      	mask = GetBattleBitmask(961,Zone,1);
	        player:setVar("trade_bcnmid",961);
	    end  	    
	elseif(Zone == 139) then -- Horlais Peak
		if((player:getCurrentMission(BASTOK) == THE_EMISSARY_SANDORIA2 or 
			player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_SANDORIA2) and player:getVar("MissionStatus") == 9) then -- Mission 2-3
			mask = GetBattleBitmask(0,Zone,1);
			player:setVar("trade_bcnmid",0);
		end
	elseif(Zone == 140) then -- Ghelsba Outpost
		local MissionStatus = player:getVar("MissionStatus");
		local sTcCompleted = player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN)
		if(player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and (sTcCompleted and MissionStatus <= 2 or sTcCompleted == false and MissionStatus == 2)) then -- Sandy Mission 1-3
			mask = GetBattleBitmask(32,Zone,1);
			player:setVar("trade_bcnmid",32);
		elseif(player:hasKeyItem(DRAGON_CURSE_REMEDY)) then -- DRG Flag Quest
			mask = GetBattleBitmask(33,Zone,1);
			player:setVar("trade_bcnmid",33);
		end
	elseif(Zone == 144) then -- Waughroon Shrine
		if((player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 or 
			player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) and player:getVar("MissionStatus") == 10) then -- Mission 2-3
			mask = GetBattleBitmask(64,Zone,1);
			player:setVar("trade_bcnmid",64);
		elseif((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 2)) then
			mask = GetBattleBitmask(67,Zone,1);
			player:setVar("trade_bcnmid",67);
		end
	elseif(Zone == 146) then -- Balga's Dais
		if(player:hasKeyItem(DARK_KEY)) then -- Mission 2-3
			mask = GetBattleBitmask(96,Zone,1);
			player:setVar("trade_bcnmid",96);
		end 
	elseif(Zone == 163) then -- Sacrificial Chamber
		if(player:hasKeyItem(SACRIFICIAL_CHAMBER_KEY)) then -- Zilart Mission 4
			mask = GetBattleBitmask(128,Zone,1);
			player:setVar("trade_bcnmid",128);
		end
	elseif(Zone == 165) then -- Throne Room
		if(player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 2) then -- Mission 5-2
			mask = GetBattleBitmask(160,Zone,1);
			player:setVar("trade_bcnmid",160);
		end
	elseif(Zone == 168) then -- Chamber of Oracles
		if(player:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES or player:getCurrentMission(ZILART) == THE_CHAMBER_OF_ORACLES) then -- Zilart Mission 6
			mask = GetBattleBitmask(192,Zone,1);
			player:setVar("trade_bcnmid",192);
		end
	elseif(Zone == 170) then -- Full Moon Fountain
		if(player:hasKeyItem(MOON_BAUBLE)) then -- The Moonlit Path
			mask = GetBattleBitmask(224,Zone,1);
			player:setVar("trade_bcnmid",224);
		end
	elseif(Zone == 179) then -- Stellar Fulcrum
		if(player:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER and player:getVar("ZilartStatus") == 3) then -- Zilart Mission 8
			mask = GetBattleBitmask(256,Zone,1);
			player:setVar("trade_bcnmid",256);
		end
	elseif(Zone == 180) then -- La'Loff Amphitheater
		if(player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1) then
			local qmid = npc:getID();
			if (qmid == 17514548 and player:hasKeyItem(SHARD_OF_APATHY) == false) then -- Hume, Ark Angels 1
				mask = GetBattleBitmask(288,Zone,1);
				player:setVar("trade_bcnmid",288);
			elseif (qmid == 17514549 and player:hasKeyItem(SHARD_OF_COWARDICE) == false) then -- Tarutaru, Ark Angels 2
				mask = GetBattleBitmask(289,Zone,1);
				player:setVar("trade_bcnmid",289);
			elseif (qmid == 17514550 and player:hasKeyItem(SHARD_OF_ENVY) == false) then -- Mithra, Ark Angels 3
				mask = GetBattleBitmask(290,Zone,1);
				player:setVar("trade_bcnmid",290);
			elseif (qmid == 17514551 and player:hasKeyItem(SHARD_OF_ARROGANCE) == false) then -- Elvaan, Ark Angels 4
				mask = GetBattleBitmask(291,Zone,1);
				player:setVar("trade_bcnmid",291);
			elseif (qmid == 17514552 and player:hasKeyItem(SHARD_OF_RAGE) == false) then -- Galka, Ark Angels 5
				mask = GetBattleBitmask(292,Zone,1);
				player:setVar("trade_bcnmid",292);
			end
		end
	elseif(Zone == 201) then -- Cloister of Gales
		if(player:hasKeyItem(TUNING_FORK_OF_WIND)) then -- Trial by Wind
			mask = GetBattleBitmask(416,Zone,1);
			player:setVar("trade_bcnmid",416);
		end
	elseif(Zone == 202) then -- Cloister of Storms
		if(player:hasKeyItem(TUNING_FORK_OF_LIGHTNING)) then -- Trial by Lightning
			mask = GetBattleBitmask(448,Zone,1);
			player:setVar("trade_bcnmid",448);
		end
	elseif(Zone == 203) then -- Cloister of Frost
		if(player:hasKeyItem(TUNING_FORK_OF_ICE)) then -- Trial by Ice
			mask = GetBattleBitmask(480,Zone,1);
			player:setVar("trade_bcnmid",480);
		end
	elseif(Zone == 206) then -- Qu'Bia Arena
		if(player:getCurrentMission(player:getNation()) == 14 and player:getVar("MissionStatus") == 11) then -- Mission 5-1
			mask = GetBattleBitmask(512,Zone,1); -- bcnmid/zone/mode
			player:setVar("trade_bcnmid",512); -- Remember to store the BCNMID for EventUpdate/Finish!
		end
	elseif(Zone == 207) then -- Cloister of Flames
		if(player:hasKeyItem(TUNING_FORK_OF_FIRE)) then -- Trial by Fire
			mask = GetBattleBitmask(544,Zone,1);
			player:setVar("trade_bcnmid",544);
		end
	elseif(Zone == 209) then -- Cloister of Tremors
		if(player:hasKeyItem(TUNING_FORK_OF_EARTH)) then -- Trial by Earth
			mask = GetBattleBitmask(576,Zone,1);
			player:setVar("trade_bcnmid",576);
		end
	elseif(Zone == 211) then -- Cloister of Tides
		if(player:hasKeyItem(TUNING_FORK_OF_WATER)) then -- Trial by Water
			mask = GetBattleBitmask(608,Zone,1);
			player:setVar("trade_bcnmid",608);
		end
	end
	
	if(mask == -1) then
		print("BCNMID/Mask pair not found"); -- something went wrong
		return true;
	elseif(mask ~= 0) then
		player:startEvent(0x7d00,0,0,0,mask,0,0,0,0);
		print("BCNMID found with mask "..mask);
		return true;
	else
		return false;
	end
end;