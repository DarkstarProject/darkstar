-----------------------------------
--  Area: Castle Oztroja
--  NPC:  Daa Bola the Seer
--  Type: Quest NPC
--  !pos -157.978 -18.179 193.458 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local BirdsVar = player:getVar("ForTheBirdsQuest");

    if (player:getQuestStatus(OTHER_AREAS,FOR_THE_BIRDS) == QUEST_ACCEPTED and BirdsVar == 0) then
        if (trade:hasItemQty(1663,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0057);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(OTHER_AREAS,FOR_THE_BIRDS) >= QUEST_ACCEPTED) then
        player:startEvent(0x0056);
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

    if (csid == 0x0057) then
        player:setVar("ForTheBirdsQuest",1);
        player:tradeComplete();
    end
end;