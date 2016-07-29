-----------------------------------
--  Area: Bastok Markets
--   NPC: Zacc
--  Type: Quest NPC
-- @zone: 235
--  @pos -255.709 -13 -91.379
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;

require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_COMPLETED) then -- Quest: Wish Upon a Star - Quest has been completed.
        player:startEvent(0x0150);
    elseif (player:getFameLevel(BASTOK) > 4 and player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_AVAILABLE) then -- Quest: Wish Upon a Star - Start quest.
        player:startEvent(0x0149);
    else -- Standard dialog
        player:startEvent(0x0148);
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

    if (csid == 0x0149) then -- Quest: Wish Upon a Star
        player:addQuest(BASTOK, WISH_UPON_A_STAR);
        player:setVar("WishUponAStar_Status", 1);
    end
end;
