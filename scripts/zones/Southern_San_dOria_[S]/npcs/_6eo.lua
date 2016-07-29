-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Door:House
-- @zone 80
-- @pos 148 0 27
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED and player:getVar("KnotQuiteThere") == 3) then
        player:startEvent(0x003F);
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
    if (csid == 0x003F) then
        player:completeQuest(CRYSTAL_WAR, KNOT_QUITE_THERE);
        player:addItem(751);
        player:messageSpecial(ITEM_OBTAINED,751); --Platinum Beastcoin
        player:setVar("KnotQuiteThere",0);
    end
end;