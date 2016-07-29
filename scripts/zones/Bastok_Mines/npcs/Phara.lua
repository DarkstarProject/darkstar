-----------------------------------
-- Area: Bastok Mines
-- NPC:  Phara
-- Starts and Finishes Quest: The doorman (start)
-- Involved in Quest: The Talekeeper's Truth
-- @zone 234
-- @pos 75 0 -80
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    theDoorman = player:getQuestStatus(BASTOK,THE_DOORMAN);
    theTalekeeperTruth = player:getQuestStatus(BASTOK,THE_TALEKEEPER_S_TRUTH);

    if (theDoorman == QUEST_AVAILABLE and player:getMainJob() == 1 and player:getMainLvl() >= 40) then
        player:startEvent(0x0097); -- Start Quests "The doorman"
    elseif (player:hasKeyItem(SWORD_GRIP_MATERIAL)) then
        player:startEvent(0x0098); -- Need to wait 1 vanadiel day
    elseif (player:getVar("theDoormanCS") == 2 and VanadielDayOfTheYear() ~= player:getVar("theDoorman_time")) then
        player:startEvent(0x0099); -- The doorman notification, go to naji
    elseif (theDoorman == QUEST_COMPLETED and theTalekeeperTruth == QUEST_AVAILABLE) then
        player:startEvent(0x009a); -- New standard dialog
    else
        player:startEvent(0x0096); -- Standard dialog
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0097) then
        player:addQuest(BASTOK,THE_DOORMAN);
        player:setVar("theDoormanCS",1);
    elseif (csid == 0x0098) then
        player:setVar("theDoorman_time",VanadielDayOfTheYear());
        player:setVar("theDoormanCS",2);
        player:delKeyItem(SWORD_GRIP_MATERIAL);
    elseif (csid == 0x0099) then
        player:addKeyItem(YASINS_SWORD);
        player:messageSpecial(KEYITEM_OBTAINED,YASINS_SWORD);
        player:setVar("theDoormanCS",3);
        player:setVar("theDoorman_time",0);
    elseif (csid == 0x009a) then
        player:setVar("theTalekeeperTruthCS",1);
    end

end;