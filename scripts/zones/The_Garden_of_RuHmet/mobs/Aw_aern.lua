-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Aw_aern PH (Ix'Aern DRK and DRG)
-----------------------------------

package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;

-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH
    local realAwAern_PH = 16920769; -- The actual PH mob.
    local IxAernDRG = 16921022;

    -- Pick the Ix'Aern (DRG) PH if the server doesn't have one, and the if the actual PH/NM isn't up. Then, set it.
    if (GetMobAction(realAwAern_PH) == 0 and GetMobAction(IxAernDRG) == 0 and GetServerVariable("[SEA]IxAernDRG_PH") == 0) then  -- This should be cleared when the mob is killed.
        local AwAernGroups = {16920777,16920781,16920785,16920789}; -- First Aw'Aerns in each group.
        IxAernDRG_PH = math.random(AwAernGroups) + math.random(0, 2); -- The 4th mobid in each group is a pet. F that son
        SetServerVariable("[SEA]IxAernDRG_PH", IxAernDRG_PH);
    end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local currentMobID = mob:getID();
    
    -- Ix'Aern (DRG) Placeholder mobs
    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH.
    local realAwAern_PH = 16920769; -- The actual PH mob.
    
    -- Ix'Aern (DRG) and his minions (Wynavs)
    local IxAernDRG = GetMobByID(16921022);
	local wynavA = GetMobByID(16921023);
	local wynavB = GetMobByID(16921024);
	local wynavC = GetMobByID(16921025);	
    
    -- Ix'Aern (DRK) and his RNG minions (Qn'Aerns)
    local IxAernDRK = GetMobByID(16921018);
    local QnAernA = GetMobByID(16921019);
    local QnAernB = GetMobByID(16921020);
    
    -- If the mob killed was the randomized PH spawner, then spawn the PH in it's actual location.
    if (IxAernDRG_PH == currentMobID) then
        -- Select spawn location based on ID
        if (currentMobID >= 16920777 and currentMobID < 16920781) then
            GetMobByID(realAwAern_PH):setSpawn(-520, 5, -520, 225); -- Bottom Left
            
        elseif (currentMobID >= 16920781 and currentMobID < 16920785) then
            GetMobByID(realAwAern_PH):setSpawn(-520, 5, -359, 30); -- Top Left
            
        elseif (currentMobID >= 16920785 and currentMobID < 16920789) then
            GetMobByID(realAwAern_PH):setSpawn(-319, 5, -359, 95); -- Top Right
            
        elseif (currentMobID >= 16920789 and currentMobID < 16920783) then
            GetMobByID(realAwAern_PH):setSpawn(-319, 5, -520, 156); -- Bottom Right
            
        end;
        SpawnMob(realAwAern_PH);
        SetServerVariable("[SEA]IxAernDRG_PH", 0); -- Clear the variable because it is spawned!
        
    -- Spawn the NM if the PH was killed at the PH's location.
    elseif (currentMobID == realAwAern_PH) then
        IxAernDRG:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos());
        SpawnMob(IxAernDRG:getID(), 300):updateEnmity(killer);
        -- A
        wynavA:setSpawn(mob:getXPos()+4, mob:getYPos(), mob:getZPos());
        SpawnMob(wynavA:getID(), 300):updateEnmity(killer);
        -- B
        wynavB:setSpawn(mob:getXPos()-4, mob:getYPos(), mob:getZPos());
        SpawnMob(wynavB:getID(), 300):updateEnmity(killer);
        -- C
        wynavC:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos()+4);
        SpawnMob(wynavC:getID(), 300):updateEnmity(killer);
    end    
end;