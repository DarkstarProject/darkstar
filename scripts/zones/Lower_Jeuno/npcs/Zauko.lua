-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Zauko
-- Involved in Quests: Save the Clock Tower, Community Service
-- @zone 245
-- @pos -3 0 11
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/NPCIDs");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    ----- Save The Clock Tower Quest -----
    if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
        a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
        if (a == 0 or (a ~= 256 and a ~= 288 and a ~= 320 and a ~= 384 and a ~= 768 and a ~= 352 and a ~= 896 and a ~= 416 and 
           a ~= 832 and a ~= 448 and a ~= 800 and a ~= 480 and a ~= 864 and a ~= 928 and a ~= 960 and a ~= 992)) then 
            player:startEvent(0x0032,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local hour = VanadielHour();
    local playerOnQuestId = GetServerVariable("[JEUNO]CommService");
    local doneCommService = (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED) and 1 or 0;
    local currCommService = player:getVar("currCommService");
    local hasMembershipCard = player:hasKeyItem(LAMP_LIGHTERS_MEMBERSHIP_CARD) and 1 or 0;
    
    local allLampsLit = true;
    for i=0,11 do
        local lamp = GetNPCByID(lampIdOffset + i);
        if lamp:getAnimation() == ANIMATION_CLOSE_DOOR then
            allLampsLit = false;
            break;
        end
    end

    -- debug output    
    -- player:PrintToPlayer(string.format("pid=%i done=%i curr=%i card=%i lamps=%i",playerOnQuestId,doneCommService,currCommService,hasMembershipCard,allLampsLit and 1 or 0));
    
    -- quest has already been accepted.
    if currCommService == 1 then
        if playerOnQuestId ~= player:getID() then
            player:startEvent(0x0077); -- quest left over from previous day. fail quest.
        else
            if hour >= 20 and hour < 21 then
                player:startEvent(0x0073); -- tell player it's too early to start lighting lamps.
            elseif allLampsLit then
                player:startEvent(0x0075,doneCommService); -- all lamps are lit. win quest.
            elseif hour >= 21 or hour < 1 then
                player:startEvent(0x0072); -- tell player they can start lighting lamps.
            else
                SetServerVariable("[JEUNO]CommService",-1); -- frees player from quest, but don't allow anyone else to take it today.
                player:startEvent(0x0077); -- player didn't light lamps in time. fail quest.
            end
        end

    -- quest is available to player, nobody is currently on it, and the hour is right
    elseif player:getFameLevel(JEUNO) >= 1 and playerOnQuestId == 0 and (hour >= 20 or hour < 1) then
        player:startEvent(0x0074,doneCommService);

    -- default dialog including option to drop membership card
    else
        player:startEvent(0x0076,hasMembershipCard);

    end
end;
    
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    if csid == 0x0074 and option == 0 then
        -- player accepts quest
        -- if nobody else has already been assigned to the quest, including Vhana, give it to this player

        local doneCommService = (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED) and 1 or 0;
        local playerOnQuestId = GetServerVariable("[JEUNO]CommService");
        local hour = VanadielHour();
        
        if playerOnQuestId == 0 and (hour >= 20 or hour < 1) then
            -- nobody is currently on the quest
            SetServerVariable("[JEUNO]CommService",player:getID());
            player:addQuest(JEUNO,COMMUNITY_SERVICE);
            player:setVar("currCommService",1);
            player:updateEvent(1,doneCommService);
        else
            -- either another player or vasha have been assigned the quest
            player:updateEvent(0,doneCommService);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

    -- ClockTower Quest --    
    if (csid == 0x0032) then 
        player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
        player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 256);
    
    ---- Community Service Quest ----        

    elseif csid == 0x0075 then
        if player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) ~= QUEST_COMPLETED then
            -- first victory
            player:addFame(JEUNO,30);
        else
            -- repeat victory. offer membership card.
            player:addFame(JEUNO, 15);
            if option == 1 then
                player:addKeyItem(LAMP_LIGHTERS_MEMBERSHIP_CARD);
                player:messageSpecial(KEYITEM_OBTAINED,LAMP_LIGHTERS_MEMBERSHIP_CARD);
            end
        end
        player:completeQuest(JEUNO,COMMUNITY_SERVICE);
        player:addTitle(TORCHBEARER);
        player:setVar("currCommService",0);

    elseif csid == 0x0076 and option == 1 then
        -- player drops membership card
        player:delKeyItem(LAMP_LIGHTERS_MEMBERSHIP_CARD);
            
    elseif csid == 0x0077 then
        -- player fails quest
        player:setVar("currCommService",0);

    end
end;
