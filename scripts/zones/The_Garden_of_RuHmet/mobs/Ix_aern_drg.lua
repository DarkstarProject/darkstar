-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Ix'aern (drg)
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

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
    -- TODO: summon animations?    
    if (GetMobAction(wynavA) == 0) then
        GetMobByID(wynavA):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavA, 300):updateEnmity(target);
    elseif (GetMobAction(wynavB) == 0) then
        GetMobByID(wynavB):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavB, 300):updateEnmity(target);
    elseif (GetMobAction(wynavC) == 0) then
        GetMobByID(wynavC):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(wynavC, 300):updateEnmity(target);
    end

    -- Ensure all spawned pets are doing stuff..
    for pets = wynavA, wynavC do
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
	DespawnMob(wynavA);
	DespawnMob(wynavB);
	DespawnMob(wynavC);

    -- Pick a new for PH Ix'Aern (DRG)
    SetServerVariable("[SEA]IxAernDRG_PH", AwAernDRGGroups[math.random(1, #AwAernDRGGroups)] + math.random(0, 2));
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
    -- Despawn pets.
	DespawnMob(wynavA);
	DespawnMob(wynavB);
	DespawnMob(wynavC);

    -- Pick a new PH for Ix'Aern (DRG)
    SetServerVariable("[SEA]IxAernDRG_PH", AwAernDRGGroups[math.random(1, #AwAernDRGGroups)] + math.random(0, 2));
end
