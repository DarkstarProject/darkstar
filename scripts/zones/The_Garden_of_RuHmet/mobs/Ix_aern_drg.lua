-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Ix'aern (drg)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    if (math.random(0,1) > 0) then     
        SetDropRate(4396,1870,1000); -- Deed Of Sensib.
        SetDropRate(4396,1903,0);
    else
        SetDropRate(4396,1870,0);
        SetDropRate(4396,1903,1000); -- Vice Of Aspersion
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- Spawn the pets if they are despawned
    -- TODO: animations?
    local wynavA = GetMobByID(16921023);
    local wynavB = GetMobByID(16921024);
    local wynavC = GetMobByID(16921025);	
    
    if (GetMobAction(wynavA:getID()) == 0) then
        wynavA:setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavA:getID(), 300):updateEnmity(target);
    elseif (GetMobAction(wynavB:getID()) == 0) then
        wynavB:setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavB:getID(), 300):updateEnmity(target);
    elseif (GetMobAction(wynavC:getID()) == 0) then
        wynavC:setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavC:getID(), 300):updateEnmity(target);
    end

    -- Ensure all spawned pets are doing stuff..
    for pets = wynavA:getID(), wynavC:getID() do
        if (GetMobAction(pets) == 16) then
            -- Send pet after current target..
            GetMobByID(pets):updateEnmity(target);
        end
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	-- Despawn pets..
	DespawnMob(16921023);
	DespawnMob(16921024);
	DespawnMob(16921025);
    
    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH
    local realAwAern_PH = 16920769; -- The actual PH mob.
    local IxAernDRG = 16921022;

    -- Pick the Ix'Aern (DRG) PH if the server doesn't have one, set it.
    if (GetMobAction(realAwAern_PH) == 0 and GetMobAction(IxAernDRG) == 0 and GetServerVariable("[SEA]IxAernDRG_PH") == 0) then  -- This should be cleared when the mob is killed.
        local AwAernGroups = {16920777,16920781,16920785,16920789}; -- First Aw'Aerns in each group.
        IxAernDRG_PH = math.random(AwAernGroups) + math.random(0, 2); -- The 4th mobid in each group is a pet. F that son
        SetServerVariable("[SEA]IxAernDRG_PH", IxAernDRG_PH);
    end;
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
    -- Despawn pets.
	DespawnMob(16921023);
	DespawnMob(16921024);
	DespawnMob(16921025);

    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH
    local realAwAern_PH = 16920769; -- The actual PH mob.
    local IxAernDRG = 16921022;

        -- Pick the Ix'Aern (DRG) PH if the server doesn't have one, set it.
    if (GetMobAction(realAwAern_PH) == 0 and GetMobAction(IxAernDRG) == 0 and GetServerVariable("[SEA]IxAernDRG_PH") == 0) then  -- This should be cleared when the mob is killed.
        local AwAernGroups = {16920777,16920781,16920785,16920789}; -- First Aw'Aerns in each group.
        IxAernDRG_PH = math.random(AwAernGroups) + math.random(0, 2); -- The 4th mobid in each group is a pet. F that son
        SetServerVariable("[SEA]IxAernDRG_PH", IxAernDRG_PH);
    end;
end
