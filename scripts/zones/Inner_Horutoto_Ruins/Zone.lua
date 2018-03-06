-----------------------------------
--
-- Zone: Inner_Horutoto_Ruins (192)
--
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
require("scripts/zones/Inner_Horutoto_Ruins/MobIDs");
require("scripts/globals/status");
require("scripts/globals/zone");

function onInitialize(zone)
    zone:registerRegion(1, -261, -1, -31, -257, 1, -27); -- Red
    zone:registerRegion(2, -265, -1, -26, -261, 1, -22); -- White
    zone:registerRegion(3, -258, -1, -26, -254, 1, -22); -- Black
    zone:registerRegion(4, -261, -3, 182, -257, -1, 186); -- Teleport at H-6

    UpdateTreasureSpawnPoint(INNER_HORUTOTO_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-259.996,6.399,242.859,67);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
    local circle= PORTAL_CIRCLE_BASE;
    local red   = GetNPCByID(circle);
    local white = GetNPCByID(circle+1);
    local black = GetNPCByID(circle+2);

    -- Prevent negatives..
    if (region:GetCount() < 0) then
        region:AddCount( math.abs( region:GetCount() ) );
    end

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Red Circle
            if (player:getMainJob() == JOBS.RDM and region:AddCount(1) == 1) then
                red:setAnimation(ANIMATION_OPEN_DOOR);
                if (white:getAnimation() == ANIMATION_OPEN_DOOR and black:getAnimation() == ANIMATION_OPEN_DOOR) then
                    GetNPCByID(circle+3):openDoor(30);
                    GetNPCByID(circle+4):openDoor(30);
                end
            end
        end,
        [2] = function (x)  -- White Circle
            if (player:getMainJob() == JOBS.WHM and region:AddCount(1) == 1) then
                white:setAnimation(ANIMATION_OPEN_DOOR);
                if (red:getAnimation() == ANIMATION_OPEN_DOOR and black:getAnimation() == ANIMATION_OPEN_DOOR) then
                    GetNPCByID(circle+3):openDoor(30);
                    GetNPCByID(circle+4):openDoor(30);
                end
            end
        end,
        [3] = function (x)  -- Black Circle
            if (player:getMainJob() == JOBS.BLM and region:AddCount(1) == 1) then
                black:setAnimation(ANIMATION_OPEN_DOOR);
                if (red:getAnimation() == ANIMATION_OPEN_DOOR and white:getAnimation() == ANIMATION_OPEN_DOOR) then
                    GetNPCByID(circle+3):openDoor(30);
                    GetNPCByID(circle+4):openDoor(30);
                end
            end
        end,
        [4] = function (x)  -- Teleport at H-6
            player:startEvent(47);
        end,
    }

end;

function onRegionLeave(player,region)
    local circle= PORTAL_CIRCLE_BASE;
    local red   = GetNPCByID(circle);
    local white = GetNPCByID(circle+1);
    local black = GetNPCByID(circle+2);

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Red Circle
            if (player:getMainJob() == JOBS.RDM and region:DelCount(1) == 0) then
                red:setAnimation(ANIMATION_CLOSE_DOOR);
            end
        end,
        [2] = function (x)  -- White Circle
            if (player:getMainJob() == JOBS.WHM and region:DelCount(1) == 0) then
                white:setAnimation(ANIMATION_CLOSE_DOOR);
            end
        end,
        [3] = function (x)  -- Black Circle
            if (player:getMainJob() == JOBS.BLM and region:DelCount(1) == 0) then
                black:setAnimation(ANIMATION_CLOSE_DOOR);
            end
        end,
    }

    -- Prevent negatives..
    if (region:GetCount() < 0) then
        region:AddCount( math.abs( region:GetCount() ) );
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;