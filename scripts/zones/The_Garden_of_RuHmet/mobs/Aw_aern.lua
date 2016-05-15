-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Aw_aern PH (Ix'Aern DRK and DRG)
-----------------------------------

package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;

-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH

    -- Pick the Ix'Aern (DRG) PH if the server doesn't have one, and the if the actual PH/NM isn't up. Then, set it.
    if (GetMobAction(IxAernDRG) == 0 and GetServerVariable("[SEA]IxAernDRG_PH") == 0) then  -- This should be cleared when the mob is killed.
        IxAernDRG_PH = AwAernDRGGroups[math.random(1, #AwAernDRGGroups)] + math.random(0, 2); -- The 4th mobid in each group is a pet. F that son
        SetServerVariable("[SEA]IxAernDRG_PH", IxAernDRG_PH);
    end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local currentMobID = mob:getID();

    -- Ix'Aern (DRG) Placeholder mobs
    local IxAernDRG_PH = GetServerVariable("[SEA]IxAernDRG_PH"); -- Should be be the ID of the mob that spawns the actual PH.

    -- If the mob killed was the randomized PH, then Ix'Aern (DRG) in the specific spot, unclaimed and not aggroed.
    if (IxAernDRG_PH == currentMobID) then
        -- Select spawn location based on ID
        if (currentMobID >= 16920777 and currentMobID < 16920781) then
            GetMobByID(IxAernDRG):setSpawn(-520, 5, -520, 225); -- Bottom Left
        elseif (currentMobID >= 16920781 and currentMobID < 16920785) then
            GetMobByID(IxAernDRG):setSpawn(-520, 5, -359, 30); -- Top Left
        elseif (currentMobID >= 16920785 and currentMobID < 16920789) then
            GetMobByID(IxAernDRG):setSpawn(-319, 5, -359, 95); -- Top Right
        elseif (currentMobID >= 16920789 and currentMobID < 16920793) then
            GetMobByID(IxAernDRG):setSpawn(-319, 5, -520, 156); -- Bottom Right
        end;
        SpawnMob(IxAernDRG);
        SetServerVariable("[SEA]IxAernDRG_PH", 0); -- Clear the variable because it is spawned!
    end;
end;