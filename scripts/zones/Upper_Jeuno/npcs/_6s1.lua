-----------------------------------
-- Area: Upper Jeuno
-- NPC:  Marble Bridge Eatery (Door)
-- @pos -96.6 -0.2 92.3 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

local ring =
{
    15543, -- Rajas Ring
    15544, -- Sattva Ring
    15545  -- Tamas Ring
}

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    local status = player:getVar("PromathiaStatus")
    local mission = player:getCurrentMission(COP)

    if (mission == FOR_WHOM_THE_VERSE_IS_SUNG and status == 1) then
        player:startEvent(0x271B)
    elseif (mission == FLAMES_IN_THE_DARKNESS and status == 3) then
        player:startEvent(0x271C)
    elseif (mission == DAWN and status == 4) then
        player:startEvent(0x0081)
    elseif ((mission == DAWN and status > 4) or player:hasCompletedMission(COP,DAWN)) then
        local hasRing = false

        for key, value in pairs(ring) do
            if (player:hasItem(value)) then
                hasRing = true
            end
        end

        if not (hasRing) then
            local currentDay = tonumber(os.date("%j"))
            local ringsTaken = player:getVar("COP-ringsTakenbr")
            local dateObtained = player:getVar("COP-lastRingday")

            if (ringsTaken == 0) then
                player:startEvent(0x0054, ring[1], ring[2], ring[3])
            elseif (ringsTaken == 1) then -- First time you throw away, no wait
                player:startEvent(0x00CC, ring[1], ring[2], ring[3])
            elseif (ringsTaken > 1 and (currentDay - dateObtained) >= 28) then -- Wait time is >= 28 days, not 26
                player:startEvent(0x00CC, ring[1], ring[2], ring[3])
            end
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------
function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ((csid == 0x0054 or csid == 0x00CC) and option == 4) then
        player:updateEvent(ring[1],ring[2],ring[3])
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x271B) then
        player:setVar("PromathiaStatus", 2);
    elseif (csid == 0x271C) then
        player:setVar("PromathiaStatus", 0);
        player:completeMission(COP, FLAMES_IN_THE_DARKNESS);
        player:addMission(COP, FIRE_IN_THE_EYES_OF_MEN);
    elseif (csid == 0x0081) then
        player:setVar("PromathiaStatus", 5);
    elseif ((csid == 0x0054 or csid == 0x00CC) and option >= 5 and option <= 7) then
        if (player:getFreeSlotsCount() ~= 0) then
            local currentDay = tonumber(os.date("%j"))
            local ringsTaken = player:getVar("COP-ringsTakenbr")
            player:addItem(ring[option - 4])
            player:messageSpecial(ITEM_OBTAINED, ring[option - 4])
            player:setVar("COP-ringsTakenbr", ringsTaken + 1)
            player:setVar("COP-lastRingday", currentDay)
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ring[option - 4])
        end
    end
end;
