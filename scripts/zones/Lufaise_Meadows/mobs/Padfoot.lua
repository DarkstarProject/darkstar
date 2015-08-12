-----------------------------------
-- Area: Lufaise Meadows
-- Mob:  Padfoot
-- @pos 260.445 -1.761 -27.862 24 (True Copy)     16875578
-- @pos 412.447 -0.057 -200.161 24 (Fake Copies)  16875615
-- @pos -378.950 -15.742 144.215 24    ||       16875703
-- @pos -43.689 0.487 -328.028 24      ||       16875552
-- @pos -141.523 -15.529 91.709 24     \/     16875748
-----------------------------------
 
-----------------------------------
-- OnMobSpawn Action
-----------------------------------
 
function onMobSpawn(mob)
 
  local PadfootCloneSpawn =
  {
    16875615,
    16875703,
    16875748,
    16875552
  }
 
  if (mob:getID() == 16875578) then
	local random = math.random(table.getn(PadfootCloneSpawn));
    -- pick random padfoot to spawn as
    local myPadfoot = PadfootCloneSpawn[random];
  
    local i = 1;
    while i <= (table.getn(PadfootCloneSpawn)) do
 
		local padfoot = PadfootCloneSpawn[i]
		UpdateNMSpawnPoint(padfoot);
	  
		if padfoot == myPadfoot then
			local position = GetMobByID(padfoot):getSpawnPos();
			mob:setPos(position.x, position.y, position.z);

			local otherMob = GetMobByID(myPadfoot);
			SpawnMob(myPadfoot);

			position = mob:getSpawnPos()
			otherMob:setPos(position.x, position.y, position.z);
		else
			SpawnMob(padfoot);
		end
      i = i + 1;
    end
 
    -- TODO: Add Treasure Hunter
    if (math.random((1),(100)) <= 27) then -- Hardcoded "this or this item" drop rate until implemented.
      SetDropRate(4478,14782,1000); -- Astral Earring
      SetDropRate(4478,14676,0);
    else
      SetDropRate(4478,14782,0);
      SetDropRate(4478,14676,1000); -- Assailants Ring
    end
  end
 
end;
 
-----------------------------------
-- OnMobDeath Action
-----------------------------------
 
function onMobDeath(mob,killer)
 
  local PadfootClone =
  {
    16875615,
    16875703,
    16875748,
    16875552
  }
 
  if (mob:getID() == 16875578) then
    local i = 1;
 
    while i <= (table.getn(PadfootClone)) do
      if (GetMobAction(PadfootClone[i]) ~= 0) then
        DespawnMob(PadfootClone[i]);
      end
 
      i = i + 1;
    end
 
      UpdateNMSpawnPoint(16875578);
      GetMobByID(16875578):setRespawnTime(math.random((75600),(86400))); -- 21-24 hours
  end
 
end;

