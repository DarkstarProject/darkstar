-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Streetlamp
-- Involved in Quests: Community Service
-- @pos -8 0 12 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/NPCIDs");
require("scripts/zones/Lower_Jeuno/TextIDs");

-- lamp id vary from 17780881 to 17780892
-- lamp cs vary from 0x0078 to 0x0083 (120 to 131)
local lampNum = 11;
local lampId = lampIdOffset + lampNum;
local cs = lampCsOffset + lampNum;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local hour = VanadielHour();
    local playerOnQuest = GetServerVariable("[JEUNO]CommService");

    -- player is on the quest
    if playerOnQuest == player:getID() then
        if hour >= 20 and hour < 21 then
            player:startEvent(cs,4); -- It is too early to light it.  You must wait until nine o'clock.
        elseif hour >= 21 or hour < 1 then
            if npc:getAnimation() == ANIMATION_OPEN_DOOR then
                player:startEvent(cs,2); -- The lamp is already lit.
            else
                player:startEvent(cs,1,lampNum); -- Light the lamp? Yes/No
            end
        else
            player:startEvent(cs,3); -- You have failed to light the lamps in time.
        end

    -- player is not on the quest
    else
        if npc:getAnimation() == ANIMATION_OPEN_DOOR then
            player:startEvent(cs,5); -- The lamp is lit.
        else
            player:startEvent(cs,6); -- You examine the lamp. It seems that it must be lit manually.
        end

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
    if csid == cs and option == 1 then
        -- lamp is now lit
        GetNPCByID(lampId):setAnimation(ANIMATION_OPEN_DOOR);

        -- tell player how many remain
        local lampsRemaining = 12;
        for i=0,11 do
            local lamp = GetNPCByID(lampIdOffset + i);
            if lamp:getAnimation() == ANIMATION_OPEN_DOOR then
                lampsRemaining = lampsRemaining - 1;
            end
        end
        player:messageSpecial(7241,lampsRemaining);
    end
end;