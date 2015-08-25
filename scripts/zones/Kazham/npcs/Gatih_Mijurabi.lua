-----------------------------------
--  Area: Kazham
--   NPC: Gatih Mijurabi
--  Type: Standard NPC
-- @zone: 250
--  @pos 58.249 -13.086 -49.084
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
            player:startEvent(0x00BF);
        elseif (player:getQuestStatus(OUTLANDS, PERSONAL_HYGIENE) == QUEST_ACCEPTED) then
            player:startEvent(0x00C0);
        else
            player:startEvent(0x00C3);
        end
    elseif player:getVar("PERSONAL_HYGIENE_PROGRESS") == 1 then
        player:startEvent(0x00C1);
    else 
        player:startEvent(0x00c4);
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
    if (csid == 0x00BF) then
        player:addQuest(OUTLANDS, PERSONAL_HYGIENE);
    elseif (csid == 0x00C1) then
        player:completeQuest(OUTLANDS, PERSONAL_HYGIENE);
        player:addItem(13247)   -- Mithran Stone
        player:messageSpecial(ITEM_OBTAINED,13247);
        player:setVar("PERSONAL_HYGIENE_PROGRESS", 0);
    end
end;

