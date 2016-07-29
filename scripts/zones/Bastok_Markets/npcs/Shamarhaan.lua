-----------------------------------
--  Area: Bastok Markets
--  NPC: Shamarhaan
--  Type: Quest Starter
--  Involved in quest: No Strings Attached
--  @zone: 235
--  @pos -285.382 -13.021 -84.743
--
--  Auto-Script: Requires Verification.  Verified standard dialog - thrydwolf 12/8/2011
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and NoStringsAttached == QUEST_AVAILABLE) then
        player:startEvent(0x01b2); -- initial cs to start the quest, go and see Iruki-Waraki at Whitegate
    elseif (NoStringsAttachedProgress == 1) then
        player:startEvent(0x01b3); -- reminder to go see Iruki-Waraki at Whitegate
    else
        player:startEvent(0x01b1);
    end;
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
    
    if (csid == 0x01b2) then
        player:setVar("NoStringsAttachedProgress",1);
        player:addQuest(AHT_URHGAN,NO_STRINGS_ATTACHED);
    end;
end;

