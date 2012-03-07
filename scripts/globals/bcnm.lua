-----------------------
-- BCNM Functions
-----------------------

function getMonsterList(list,zone)

	if (zone == 139) then
		if (list == 1) then
			monsterList = {	{2,17346561}
							};
		elseif (list == 2) then
			monsterList = { {2,17346563}
							};
		elseif (list == 3) then
			monsterList = {	{2,17346565}
							};
		end
	elseif (zone == 140) then
		if (list == 1) then
			monsterList = {	{3,17350662},
							{1,17350928} };
		end
	elseif(zone == 144) then
		if(list == 1) then
			monsterList = { {2,17367041};
							};
		elseif(list == 2) then
			monsterList = { {2,17367043};
							};
		elseif(list == 3) then
			monsterList = { {2,17367045};
							};
		end
	elseif (zone == 146) then
		if (list == 1) then
			monsterList = {	{2,17375233}
							};
		elseif (list == 2) then
			monsterList = {	{2,17375235}
							};
		elseif (list == 3) then
			monsterList = {	{2,17375237}
							};
		end
    elseif(zone == 202) then
        if(list == 1) then
            monsterList = { {1,17604610}
            				};
        end
    elseif(zone == 203) then
        if(list == 1) then
            monsterList = { {1,17608705}
            				};
        end
    elseif(zone == 207) then
        if(list == 1) then
            monsterList = { {1,17625089}
            				};
        end
    elseif(zone == 209) then
        if(list == 1) then
            monsterList = { {1,17633281}
            				};
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
		SpawnMob(spawnList[selectedFight][2] + x,120);
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
