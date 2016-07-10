-----------------------------------
--  Area: Western Adoulin
--  NPC: Pagnelle
--  Type: Standard NPC and Quest NPC
--  Starts, Involved with, and Finishes Quest: 'Raptor Rapture'
--  @zone 256
--  @pos -8 0 -100 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Raptor_Rapture = player:getQuestStatus(ADOULIN, RAPTOR_RAPTURE);
    local Raptor_Rapture_Status = player:getVar("Raptor_Rapture_Status");

    if (Raptor_Rapture == QUEST_AVAILABLE) then
        if (Raptor_Rapture_Status < 3) then
            -- Starts chain of events for the introduction CS for Quest: 'Raptor Rapture'.
            -- If player somehow doesn't finish the chain of events, they can just talk to Pagnelle again to retry.
            player:setVar("Raptor_Rapture_Status", 1);
            player:startEvent(0x13A8);
        else
            -- Player has finished introductory CS event chain, but didn't accept the quest.
            -- Offers Quest: 'Raptor Rapture' if player has yet to accept it.
            player:startEvent(0x13C5);
        end
    elseif (Raptor_Rapture == QUEST_ACCEPTED) then
        if (Raptor_Rapture_Status == 4) then
            -- Reminder during Quest: 'Raptor Rapture', speak to Ilney.
            player:startEvent(0x13A9);
        elseif (Raptor_Rapture_Status == 5) then
            -- Progresses Quest: 'Raptor Rapture', spoke to Ilney.
            player:startEvent(0x13AB);
        elseif (Raptor_Rapture_Status == 6) then
            local Has_Rockberries = player:hasKeyItem(ROCKBERRY1) and player:hasKeyItem(ROCKBERRY2) and player:hasKeyItem(ROCKBERRY3)
            if (Has_Rockberries) then
                -- Progresses Quest: 'Raptor Rapture', turning in rockberries.
                player:startEvent(0x13AD);
            else
                -- Reminder during Quest: 'Raptor Rapture', bring rockberries.
                player:startEvent(0x13AC);
            end
        elseif (Raptor_Rapture_Status == 7) then
            -- Reminder during Quest: 'Raptor Rapture', go to Rala.
            player:startEvent(0x13AE);
        elseif (Raptor_Rapture_Status == 8) then
            -- Finishes Quest: 'Raptor Rapture'
            player:startEvent(0x13AF);
        end
    else
        if (player:needToZone()) then
            -- Dialogue after finishing Quest: 'Raptor Rapture', before zoning
            player:startEvent(0x13B0);
        else
            -- Dialogue after finishing Quest: 'Raptor Rapture', after zoning
            player:startEvent(0x13B1);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x13A8) then
        -- Warps player to Rala Waterways to continue intrductory CS for Quest: 'Raptor Rapture'
        player:setPos(0, 0, 0, 0, 258);
    elseif ((csid == 0x13C5) and (option == 1)) then
        -- Starts Quest: 'Raptor Rapture'
        player:addQuest(ADOULIN, RAPTOR_RAPTURE);
        player:setVar("Raptor_Rapture_Status", 4);
    elseif (csid == 0x13AB) then
        -- Progresses Quest: 'Raptor Rapture', spoke to Ilney, now need rockberries.
        player:setVar("Raptor_Rapture_Status", 6);
    elseif (csid == 0x13AD) then
        -- Progresses Quest: 'Raptor Rapture', brought rockberries, now need to go to Rala.
        player:delKeyItem(ROCKBERRY1);
        player:delKeyItem(ROCKBERRY2);
        player:delKeyItem(ROCKBERRY3);
        player:setVar("Raptor_Rapture_Status", 7);
    elseif (csid == 0x13AF) then
        -- Finishing Quest: 'Raptor Rapture'
        player:setVar("Raptor_Rapture_Status", 0);
        player:completeQuest(ADOULIN, RAPTOR_RAPTURE);
        player:addCurrency('bayld', 1000 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 1000 * BAYLD_RATE);
        player:addFame(ADOULIN);
        player:needToZone(true);
    end
end;
