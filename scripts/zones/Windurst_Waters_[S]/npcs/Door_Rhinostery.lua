-----------------------------------
--  Area: Windurst Waters (S)
--   NPC: Door
-- @zone: 94

-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
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
    if (player:getQuestStatus(CRYSTAL_WAR, THE_LOST_BOOK)==QUEST_AVAILABLE and player:hasKeyItem(925)) then
    player:startEvent(143);
    player:addQuest(CRYSTAL_WAR, THE_LOST_BOOK);
    elseif player:hasKeyItem(971) then
    player:startEvent(144);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_LOST_BOOK)==QUEST_ACCEPTED) then
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
    if (csid == 144) then
    player:setVar("TheLostBook",1);
    end
end;
