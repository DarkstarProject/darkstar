-----------------------------------
--
-- Zone: Port_Jeuno (246)
--
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    local month = tonumber(os.date("%m"));
    local day = tonumber(os.date("%d"));
    -- Retail start/end dates vary, I am going with Dec 5th through Jan 5th.
    if ((month == 12 and day >= 5) or (month == 1 and day <= 5)) then
        player:ChangeMusic(0,239);
        player:ChangeMusic(1,239);
        -- No need for an 'else' to change it back outside these dates as a re-zone will handle that.
    end

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 223) then
            cs = 0x2722;
            player:setPos(-87.000, 12.000, 116.000, 128);
        elseif (prevZone == 224) then
            cs = 0x2724;
            player:setPos(-50.000, 12.000, -116.000, 0);
        elseif (prevZone == 225) then
            cs = 0x2723;
            player:setPos(16.000, 12.000, -117.000, 0);
        elseif (prevZone == 226) then
            cs = 0x2725;
            player:setPos(-24.000, 12.000, 116.000, 128);
        else
            local position = math.random(1,3) - 2;
            player:setPos(-192.5 ,-5,position,0);
            if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
                cs = 0x7534;
            end
            player:setVar("PlayerMainJob",0);
        end
    elseif (ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30
    and player:getQuestStatus(ABYSSEA, A_JOURNEY_BEGINS) == QUEST_AVAILABLE) then
        cs = 0x0144;
    end

    return cs
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    if (transport == 223) then
        player:startEvent(0x271A);
    elseif (transport == 224) then
        player:startEvent(0x271C);
    elseif (transport == 225) then
        player:startEvent(0x271B);
    elseif (transport == 226) then
        player:startEvent(0x271D);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x271A) then
        player:setPos(0,0,0,0,223);
    elseif (csid == 0x271B) then
        player:setPos(0,0,0,0,225);
    elseif (csid == 0x271C) then
        player:setPos(0,0,0,0,224);
    elseif (csid == 0x271D) then
        player:setPos(0,0,0,0,226);
    elseif (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 0x0144) then
        player:addQuest(ABYSSEA, A_JOURNEY_BEGINS);
    end
end;