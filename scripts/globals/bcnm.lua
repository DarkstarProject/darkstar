-----------------------
-- Balga's Dais
-----------------------

function getMonsterList(list,zone)

	if(zone == 139) then
		if(list == 1) then
			monsterList = {17346561,17346562};
		elseif(list == 2) then
			monsterList = {17346563,17346564};
		elseif(list == 3) then
			monsterList = {17346565,17346566};
		end
	elseif(zone == 140) then
		if(list == 1) then
			monsterList = {17350662,17350663,17350664};
		elseif(list == 2) then
			monsterList = {17350928};
		end
	elseif(zone == 146) then
		if(list == 1) then
			monsterList = {17375233,17375234};
		elseif(list == 2) then
			monsterList = {17375235,17375236};
		elseif(list == 3) then
			monsterList = {17375237,17375238};
		end
	elseif(zone == 202) then
		if(list == 1) then
			monsterList = {17604610};
		end			
	elseif(zone == 203) then
		if(list == 1) then
			monsterList = {17608705};
		end		
	end

	return monsterList;
end;


function spawnedMonsters(field,zone)

	local mobList = getMonsterList(field,zone);
	local fieldLocked = false;
	
	for i = 1, table.getn(mobList), 1 do
		if(GetMobAction(mobList[i]) ~= 0) then
			fieldLocked = true;
			break;
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

	if(spawnedMonsters(1,zone) == false) then
		counter = counter + 0x1;
	end

	if(spawnedMonsters(2,zone) == false) then
		counter = counter + 0x2;
	end
	if(spawnedMonsters(3,zone) == false) then
		counter = counter + 0x4;
	end

	if(counter > 0) then
		if(checkMask(counter, 0x1)) then
			available = 1;
		elseif(checkMask(counter, 0x2)) then
			available = 2;
		elseif(checkMask(counter, 0x4)) then
			available = 3;
		end
	else
		available = 255;
	end

	return available;
end;


function bcnmSpawn(field,fight,zone)
	local spawnList = getMonsterList(field,zone);
	
	for x = 1, table.getn(spawnList), 1 do 
		SpawnMob(spawnList[x],1800);
	end
end;

function bcnmDespawn(field,fight,zone)
	local despawnList = getMonsterList(field,zone);
	
	for x = 1, table.getn(despawnList), 1 do 
		DespawnMob(despawnList[x]);
	end
	
end;