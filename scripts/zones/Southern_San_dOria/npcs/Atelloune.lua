-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Atelloune
-- Starts and Finishes Quest: Atelloune's Lament
-- @zone 230
-- @pos 122 0 82
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    -----lady bug
    if (player:getQuestStatus(SANDORIA,ATELLOUNE_S_LAMENT) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(2506,1) and trade:getItemCount() == 1) then
            player:startEvent(0x037b);
        end
    end
    
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    
    atellounesLament = player:getQuestStatus(SANDORIA,ATELLOUNE_S_LAMENT)
    sanFame = player:getFameLevel(SANDORIA);

    if (atellounesLament == QUEST_AVAILABLE and sanFame >= 2) then
        player:startEvent(0x037a);
    elseif (atellounesLament == QUEST_ACCEPTED) then
        player:startEvent(0x037c);
    elseif (atellounesLament == QUEST_COMPLETED) then
        player:startEvent(0x0374); -- im profesors research
    elseif (sanFame < 2) then
        player:startEvent(0x0374); 
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

    if (csid == 0x037a) then
        player:addQuest(SANDORIA,ATELLOUNE_S_LAMENT);
    elseif (csid == 0x037b) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15008); -- Trainee Gloves
        else
            player:addItem(15008);
            player:messageSpecial(ITEM_OBTAINED,15008); -- Trainee Gloves
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,ATELLOUNE_S_LAMENT);
        end
    end

end;