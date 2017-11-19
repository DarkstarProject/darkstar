-----------------------------------
--  Area: Kazham
--   NPC: Gatih Mijurabi
--  Type: Standard NPC
-- @zone 250
-- !pos 58.249 -13.086 -49.084
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if player:getVar("BathedInScent") == 1 then
        if (player:getQuestStatus(OUTLANDS, PERSONAL_HYGIENE) == QUEST_AVAILABLE) then
            player:startEvent(191);
        elseif (player:getQuestStatus(OUTLANDS, PERSONAL_HYGIENE) == QUEST_ACCEPTED) then
            player:startEvent(192);
        else
            player:startEvent(195);
        end
    elseif (player:getQuestStatus(OUTLANDS, PERSONAL_HYGIENE) == QUEST_ACCEPTED and player:getVar("BathedInScent") == 0) then
        player:startEvent(193);
    else
        player:startEvent(196);
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
    if (csid == 191) then
        player:addQuest(OUTLANDS, PERSONAL_HYGIENE);
    elseif (csid == 193) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13247);
        else
            player:completeQuest(OUTLANDS, PERSONAL_HYGIENE);
            player:addItem(13247); -- Mithran Stone
            player:messageSpecial(ITEM_OBTAINED,13247);
        end
    end
end;

