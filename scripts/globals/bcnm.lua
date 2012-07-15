require("scripts/globals/status");

-- NEW SYSTEM BCNM NOTES
-- The "core" functions TradeBCNM EventUpdateBCNM EventTriggerBCNM EventFinishBCNM all return TRUE if the action performed is covered by the function. This means all the old code will still be executed if the new functions don't support it. This means that there is effectively 'backwards compatibility' with the old system.

--array to map (for each zone) the item id of the valid trade item with the bcnmid in the database
--e.g. zone,{itemid,bcnmid,itemid,bcnmid,itemid,bcnmid} 
-- DO NOT INCLUDE MAAT FIGHTS
itemid_bcnmid_map = {139,{0,0}, --Horlais Peak
					 144,{0,0}, --Waughroon Shrine
					 146,{0,0}, --Balgas Dias
					 168,{0,0}, --Chamber of Oracles
					 206,{0,0}}; --Qu'Bia Arena
					 
-- array to map (for each zone) the BCNM ID to the Event Parameter corresponding to this ID.
-- DO NOT INCLUDE MAAT FIGHTS (only included one for testing!) hum you sure ?
-- bcnmid,paramid,bcnmid,paramid,etc
-- The BCNMID is found via the database.
-- The paramid is a bitmask which you need to find out. Being a bitmask, it will be one of:
-- 1,2,4,8,16,32,64,128,256,512...
-- E.g.
-- Qu'Bia Arena Bitmask:
-- 1=Rank 5 mission, 2=Come into my parlour, 4=E-vase-ive Action, etc...
bcnmid_param_map = {139,{0,0,5,5,6,6,7,7},
					140,{32,0,33,1},
					144,{64,0,70,6,71,7,72,8},
					146,{96,0,101,5,102,6,103,7},
					168,{192,0,194,2,195,3,196,4},
					206,{512,1,517,5,518,6,519,7}};


-- Call this onTrade for burning circles
function TradeBCNM(player,zone,trade,npc)
	-- return false;
	if(player:hasStatusEffect(EFFECT_BATTLEFIELD))then --cant start a new bc
		player:messageBasic(94,0,0);
		return false;
	end
	
	if(CheckMaatFights(player,zone,trade,npc))then --This function returns true for maat fights
		return true;
	end
	--the following is for orb battles, etc
	id = ItemToBCNMID(player,zone,trade);
	
	if(id == -1)then --no valid BCNMs with this item
		--todo: display message based on zone text offset
		player:setVar("trade_bcnmid",0);
		return false;
	else --a valid BCNM with this item, start it.
		mask = GetBattleBitmask(id,zone);
		if(mask == -1)then --Cannot resolve this BCNMID to an event number, edit bcnmid_param_map!
			print("Item is for a valid BCNM but cannot find the event parameter to display to client.");
			player:setVar("trade_bcnmid",0);
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
	--return false;
	if(player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
		if(player:isInBcnm() == 1) then
			player:startEvent(0x7d03); --Run Away or Stay menu
		else --You're not in the BCNM but you have the Battlefield effect. Think: non-trader in a party
			status = player:getStatusEffect(EFFECT_BATTLEFIELD);
			playerbcnmid = status:getPower();
			playermask = GetBattleBitmask(playerbcnmid,player:getZone());
			if(playermask~=-1) then
				--This gives players who did not trade to go in the option of entering the fight
				player:startEvent(0x7d00,0,0,0,playermask,0,0,0,0);
			else
				player:messageBasic(94,0,0);
			end
		end
		return true;
	else
		if (checkNonTradeBCNM(player,npc)) then
			return true;
		end
	end
	
	return false;
end;

function EventUpdateBCNM(player,csid,option)
	-- return false;
	id = player:getVar("trade_bcnmid"); --this is 0 if the bcnm isnt handled by new functions
	
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
		
		inst = player:bcnmRegister(id);
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
		instance = player:getVar("bcnm_instanceid_tick");
		instance = instance + 1;
		player:setVar("bcnm_instanceid_tick",instance);
		
		if(instance == player:getVar("bcnm_instanceid"))then
			--respond to this packet
			mask = GetBattleBitmask(id,player:getZone());
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
		return true;
	end
	
end;

--Returns TRUE if you're trying to do a maat fight, regardless of outcome e.g. if you trade testimony on wrong job, this will return true in order to prevent further execution of TradeBCNM. Returns FALSE if you're not doing a maat fight (in other words, not trading a testimony!!)
function CheckMaatFights(player,zone,trade,npc)
	player:setVar("trade_bcnmid",0);
	--check for maat fights (one maat fight per zone in the db, but >1 mask entries depending on job, so we
	--need to choose the right one depending on the players job, and make sure the right testimony is traded,
	--and make sure the level is right!
	itemid = trade:getItem();
	job = player:getMainJob();
	lvl = player:getMainLvl();
	
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

function GetBattleBitmask(id,zone)
	--normal sweep for NON MAAT FIGHTS
	for zoneindex = 1, table.getn(bcnmid_param_map), 2 do
		if(zone==bcnmid_param_map[zoneindex])then --matched zone
			for bcnmindex = 1, table.getn(bcnmid_param_map[zoneindex + 1]), 2 do --loop bcnms in this zone
				if(id==bcnmid_param_map[zoneindex+1][bcnmindex])then --found bcnmid
					return bcnmid_param_map[zoneindex+1][bcnmindex+1];
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
					return itemid_bcnmid_map[zoneindex+1][bcnmindex+1];
				end
			end
		end
	end
	return -1;
end;

-- E.g. mission checks go here, you must know the right bcnmid for the mission you want to code.
--      You also need to know the bitmask (event param) which should be put in bcnmid_param_map
function checkNonTradeBCNM(player,npc)
	--EXAMPLE: Mission 5-1 in Qu'Bia Arena
	if(player:getZone()==206) then --also need to check if Mission 5-1 is active
		mask = GetBattleBitmask(512,206); --bcnmid=512
		if(mask==-1) then --something went wrong
			print("BCNMID/Mask pair not found");
		else
			print("BCNMID found with mask "..mask);
			player:startEvent(0x7d00,0,0,0,mask,0,0,0,0);
			-- Remember to store the BCNMID for EventUpdate/Finish!
			player:setVar("trade_bcnmid",512);
			return true;
		end
	end
	return false;
end;


------------------------------------------------------------------------------------------------
--		DEPRECATED BCNM CODE IS BELOW THIS POINT.
--		DEPRECATED BCNM CODE IS BELOW THIS POINT.
--		DEPRECATED BCNM CODE IS BELOW THIS POINT.
------------------------------------------------------------------------------------------------

-----------------------
-- BCNM Menu
-----------------------

--Zone,{[TRADE]item,job,result(first menu),result(update)...}
fightList = {139,{1426,1,32,5,1429,4,64,6,1436,11,128,7},			-- Horlais Peak
			 144,{1166,0,16,4,1430,5,64,6,1431,6,128,7,1434,9,256,8},			-- Waughroon Shrine
			 146,{1427,2,32,5,1428,3,64,6,1440,15,128,7},			-- Balga's Dais
			 168,{1437,12,4,2,1438,13,8,3,1439,14,16,4},			-- Chamber of Oracles
			 206,{1432,7,32,5,1433,8,64,6,1435,10,128,7} };			-- Qu'Bia Arena

function getTradeFightBCNM(player,zone,trade)
	
	bcnmFight = 0; LvL = player:getMainLvl(); mJob = player:getMainJob(); count = trade:getItemCount();
	
	for nb = 1, table.getn(fightList), 2 do
		if(fightList[nb] == zone) then
			for nbi = 1, table.getn(fightList[nb + 1]), 4 do
				if(player:getQuestStatus(JEUNO,SHATTERING_STARS) ~= 0 and fightList[nb + 1][nbi + 1] ~= 0 and player:getVar("maatDefeated") == 0) then
					if(trade:hasItemQty(fightList[nb + 1][nbi],1) and count == 1 and mJob == fightList[nb + 1][nbi + 1] and LvL >= 66) then
						bcnmFight = fightList[nb + 1][nbi + 2];
					end
				-- elseif for BCNM orb (job = 0)
				elseif(fightList[nb + 1][nbi + 1] == 0) then
					if(trade:hasItemQty(fightList[nb + 1][nbi],1) and count == 1) then
						bcnmFight = fightList[nb + 1][nbi + 2];
					end
				end
			end
		end
	end
	
	return bcnmFight;
end;

function getUpdateFightBCNM(player,zone,item)
	
	bcnmFight = 0; 
	
	for nb = 1, table.getn(fightList), 2 do
		if(fightList[nb] == zone) then
			for nbi = 1, table.getn(fightList[nb + 1]), 4 do
				if(fightList[nb + 1][nbi + 1] ~= 0 and fightList[nb + 1][nbi] == item) then
					bcnmFight = fightList[nb + 1][nbi + 3];
				-- elseif for BCNM orb (job = 0)
				elseif(fightList[nb + 1][nbi + 1] == 0 and fightList[nb + 1][nbi] == item) then
					bcnmFight = fightList[nb + 1][nbi + 3];
					player:tradeComplete();
				end
			end
		end
	end
	
	return bcnmFight;
end;

-----------------------
-- BCNM Functions
-----------------------

function getMonsterList(list,zone)

	if (zone == 139) then
		if (list == 1) then
			monsterList = {	{2,17346561},{0,0},{0,0},{0,0},{0,0},{1,17346585},{1,17346588},{1,17346591} };
		elseif (list == 2) then
			monsterList = { {2,17346563},{0,0},{0,0},{0,0},{0,0},{1,17346586},{1,17346589},{1,17346592} };
		elseif (list == 3) then
			monsterList = {	{2,17346565},{0,0},{0,0},{0,0},{0,0},{1,17346587},{1,17346590},{1,17346593} };
		end
	elseif (zone == 140) then
		if (list == 1) then
			monsterList = {	{3,17350662},{1,17350928} };
		end
	elseif(zone == 144) then
		if(list == 1) then
			monsterList = { {2,17367041},{0,0},{0,0},{0,0},{4,17367059},{0,0},{1,17367074},{1,17367077},{2,17367080} };
		elseif(list == 2) then
			monsterList = { {2,17367043},{0,0},{0,0},{0,0},{4,17367064},{0,0},{1,17367075},{1,17367078},{2,17367082} };
		elseif(list == 3) then
			monsterList = { {2,17367045},{0,0},{0,0},{0,0},{4,17367069},{0,0},{1,17367076},{1,17367079},{2,17367084} };
		end
	elseif (zone == 146) then
		if (list == 1) then
			monsterList = {	{2,17375233},{0,0},{0,0},{0,0},{0,0},{1,17375257},{1,17375260},{2,17375263} };
		elseif (list == 2) then
			monsterList = {	{2,17375235},{0,0},{0,0},{0,0},{0,0},{1,17375258},{1,17375261},{2,17375265} };
		elseif (list == 3) then
			monsterList = {	{2,17375237},{0,0},{0,0},{0,0},{0,0},{1,17375259},{1,17375261},{2,17375267} };
		end
	elseif (zone == 163) then
		if (list == 1) then
			monsterList = {	{4,17444865},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		elseif (list == 2) then
			monsterList = {	{4,17444870},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		elseif (list == 3) then
			monsterList = {	{4,17444875},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		end
	elseif (zone == 165) then
		if (list == 1) then
			monsterList = {	{1,17453057},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		elseif (list == 2) then
			monsterList = {	{1,17453058},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		elseif (list == 3) then
			monsterList = {	{1,17453059},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0} };
		end
	elseif (zone == 168) then
		if (list == 1) then
			monsterList = {	{3,17465345},{0,0},{1,17465354},{1,17465357},{2,17465360} };
		elseif (list == 2) then
			monsterList = {	{3,17465348},{0,0},{1,17465355},{1,17465358},{2,17465362} };
		elseif (list == 3) then
			monsterList = {	{3,17465351},{0,0},{1,17465356},{1,17465359},{2,17465364} };
		end
	elseif (zone == 179) then
		if (list == 1) then
			monsterList = {	{1,17510401},{0,0} };
		elseif (list == 2) then
			monsterList = {	{1,17510402},{0,0} };
		elseif (list == 3) then
			monsterList = {	{1,17510403},{0,0} };
		end
    elseif(zone == 202) then
        if(list == 1) then
            monsterList = { {1,17604610} };
        end
    elseif(zone == 203) then
        if(list == 1) then
            monsterList = { {1,17608705} };
        end
	elseif (zone == 206) then
		if (list == 1) then
			monsterList = {	{3,17621007},{0,0},{0,0},{0,0},{0,0},{1,17621056},{1,17621059},{1,17621062} };
		elseif (list == 2) then
			monsterList = {	{3,17620993},{0,0},{0,0},{0,0},{0,0},{1,17621057},{1,17621060},{1,17621063} };
		elseif (list == 3) then
			monsterList = {	{3,17621000},{0,0},{0,0},{0,0},{0,0},{1,17621058},{1,17621061},{1,17621064} };
		end
    elseif(zone == 207) then
        if(list == 1) then
            monsterList = { {1,17625089} };
        end
    elseif(zone == 209) then
        if(list == 1) then
            monsterList = { {1,17633281} };
        end
    end

    return monsterList;
end;


function spawnedMonsters(field,zone)

	local mobList = getMonsterList(field,zone);
	local fieldLocked = false;

	for i = 1, table.getn(mobList), 1 do
		for j = 1, mobList[i][1], 1 do
			if (GetMobAction(mobList[i][2]+j-1) ~= 0) then
				fieldLocked = true;
				break;
			end
		end
	end

	return fieldLocked;
end;

function checkMask(count,mask)
	return (count % (2*mask) >= mask)
end;

function getAvailableBattlefield(zone)
	local available = 0;
	local counter = 0;

	for z = 0, 2, 1 do
		if (spawnedMonsters(z+1,zone) == false) then
			counter = counter + 2^z;
		end
	end

	if (counter > 0) then
		if (checkMask(counter, 0x1)) then
			available = 1;
		elseif (checkMask(counter, 0x2)) then
			available = 2;
		elseif (checkMask(counter, 0x4)) then
			available = 3;
		end
	else
		available = 255;
	end

	return available;
end;


function bcnmSpawn(field,fight,zone)
	local spawnList = getMonsterList(field,zone);
	local selectedFight = fight - 99;

	for x = 0,spawnList[selectedFight][1]-1,1 do
		SpawnMob(spawnList[selectedFight][2] + x,1800);
	end
end;

function bcnmDespawn(field,fight,zone)
	local despawnList = getMonsterList(field,zone);

	if (zone == 140) then
		local selectedFight = fight + 1;
	else
		local selectedFight = fight - 99;
	end

	for x = 0,despawnList[selectedFight][1]-1,1 do
		DespawnMob(despawnList[selectedFight][2] + x);
	end

end;
