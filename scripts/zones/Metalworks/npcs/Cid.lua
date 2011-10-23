-----------------------------------
-- Area: Metalworks
-- NPC: Cid
-- Starts & Finishes Quest: Cid's Secret
-- Starts & Finishes Quest: The Usual
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	CidsSecret = player:getQuestStatus(BASTOK,CID_S_SECRET);

    if (player:getFameLevel(BASTOK) >= 4 and CidsSecret ~= 2) then
        questKeyItem = player:hasKeyItem(UNFINISHED_LETTER);

        if (CidsSecret == 0) then
            player:startEvent(0x01fb);
        elseif (player:getVar("CidsSecret_Event") == 1 and questKeyItem == false) then
            player:startEvent(0x01fc);
        elseif (questKeyItem) then
            player:startEvent(0x01fd);
        else
            player:startEvent(0x01f6);
        end
    else
        player:startEvent(0x01f4);
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
    if (csid == 0x01fb and option == 0) then
        player:addQuest(BASTOK,CID_S_SECRET);
    elseif (csid == 0x01fd) then
        player:completeQuest(BASTOK,CID_S_SECRET);
        player:addFame(BASTOK,BAS_FAME*50);
        player:addItem(RAM_MANTLE);
        player:messageSpecial(ITEM_OBTAINED,RAM_MANTLE);
        player:delKeyItem(UNFINISHED_LETTER);
        player:setVar("CidsSecret_Event",0);
     end
end;
