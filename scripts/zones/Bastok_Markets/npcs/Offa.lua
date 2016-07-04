-----------------------------------
--  Area: Bastok Markets
--   NPC: Offa
--  Type: Quest NPC
--  @pos -281.628 -16.971 -140.607 235
--
-- Auto-Script: Requires Verification. Verified standard dialog - thrydwolf 12/18/2011
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
    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);
    if (SmokeOnTheMountain == QUEST_ACCEPTED) then
        player:startEvent(0x00de);
    else
        player:startEvent(0x007c);
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
end;

