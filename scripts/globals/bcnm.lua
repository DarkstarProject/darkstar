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
	elseif (zone == 168) then
		if (list == 1) then
			monsterList = {	{0,0},{0,0},{1,17465354},{1,17465357},{2,17465360} };
		elseif (list == 2) then
			monsterList = {	{0,0},{0,0},{1,17465355},{1,17465358},{2,17465362} };
		elseif (list == 3) then
			monsterList = {	{0,0},{0,0},{1,17465356},{1,17465359},{2,17465364} };
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
