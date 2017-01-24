-----------------------------------
--
-- Zone: Aht_Urhgan_Whitegate (50)
--
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,57,-1,-70,62,1,-65); -- Sets Mark for "Got It All" Quest cutscene.
    zone:registerRegion(2,-96,-7,121,-64,-5,137); -- Sets Mark for "Vanishing Act" Quest cutscene.
    zone:registerRegion(3,14,-7,-65,37,-2,-41); -- TOAU Mission 1 CS area
    zone:registerRegion(4,75,-3,25,90,1,59);
    zone:registerRegion(5,73,-7,-137,95,-3,-115);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 46) then
            cs = 0x00c9;
        elseif (prevZone == 59) then
            cs = 0x00cc;
        elseif (prevZone == 58) then
            cs = 0x00cc;
        else
            -- MOG HOUSE EXIT
            local position = math.random(1,5) - 83;
            player:setPos(-100,0,position,0);
        end
    end

    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Cutscene for Got It All quest.
            if (player:getVar("gotitallCS") == 5) then
                player:startEvent(526);
            end
        end,
        [2] = function (x) -- CS for Vanishing Act Quest
            if (player:getVar("vanishingactCS") == 3) then
                player:startEvent(44);
            end
        end,
        [3] = function (x) -- TOAU Mission 1
            if (player:getCurrentMission(TOAU)== LAND_OF_SACRED_SERPENTS) then
                player:startEvent(3000,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU) == A_MERCENARY_LIFE) then
                if (prevZone ~= 50) then
                    player:startEvent(3050,3,3,3,3,3,3,3,3,0);
                end
            end
        end,
        [4] = function (x) -- AH mission
            if (player:getCurrentMission(TOAU)== KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 2) then
                player:startEvent(3024,0,0,0,0,0,0,0,0,0);
            end
        end,
        [5] = function (x) -- AH mission
            if (player:getCurrentMission(TOAU)== KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 3) then
                player:startEvent(3026,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU) == WESTERLY_WINDS and player:getVar("AhtUrganStatus") == 0) then
                player:startEvent(3027,0,0,0,0,0,0,0,0,0);
            end
        end,
    }
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    if (transport == 46 or transport == 47) then
        player:startEvent(0x00c8);
    elseif (transport == 58 or transport == 59) then
        player:startEvent(0x00cb);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3050 and option == 1) then
        if (player:getLocalVar("A_MERCENARY_LIFE") == 0) then
            player:setLocalVar("A_MERCENARY_LIFE", 1);
            player:updateEvent(1,0,0,0,0,0,0,0);
        else
            player:updateEvent(3,0,0,0,0,0,0,0);
        end
    elseif (csid == 3050 and option == 2) then
        if (player:getLocalVar("A_MERCENARY_LIFE") == 0) then
            player:setLocalVar("A_MERCENARY_LIFE", 1);
            player:updateEvent(2,0,0,0,0,0,0,0);
        else
            player:updateEvent(3,0,0,0,0,0,0,0);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 44) then
        player:setVar("vanishingactCS",4);
        player:setPos(-80,-6,122,5);
    elseif (csid == 200) then
        player:setPos(0,-2,0,0,47);
    elseif (csid == 201) then
        player:setPos(-11,2,-142,192);
    elseif (csid == 203) then
        player:setPos(0,-2,0,0,58);
    elseif (csid == 204) then
        player:setPos(11,2,142,64);
    elseif (csid == 526) then
        player:setVar("gotitallCS",6);
        player:setPos(60,0,-71,38);
    elseif (csid == 3000) then
        player:addKeyItem(SUPPLIES_PACKAGE);
        player:completeMission(TOAU,LAND_OF_SACRED_SERPENTS,player);
        player:addMission(TOAU,IMMORTAL_SENTRIES,player);
        player:messageSpecial(KEYITEM_OBTAINED,SUPPLIES_PACKAGE);
    elseif (csid == 3024) then
        player:setVar("AhtUrganStatus",3);
    elseif (csid == 3026) then
        player:setVar("AhtUrganStatus",0);
        player:addKeyItem(RAILLEFALS_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,RAILLEFALS_LETTER);
        player:completeMission(TOAU,KNIGHT_OF_GOLD);
        player:addMission(TOAU,CONFESSIONS_OF_ROYALTY);
    elseif (csid == 3027) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
        else
            player:setVar("AhtUrganStatus",1)
            player:addKeyItem(RAILLEFALS_NOTE);
            player:setTitle(483);
            player:addItem(2185,1);
            player:messageSpecial(KEYITEM_OBTAINED,RAILLEFALS_NOTE);
            player:messageSpecial(ITEM_OBTAINED,2185);
        end
    elseif (csid == 3050) then
        player:completeMission(TOAU,A_MERCENARY_LIFE);
        player:addMission(TOAU,UNDERSEA_SCOUTING);
    end
end;
