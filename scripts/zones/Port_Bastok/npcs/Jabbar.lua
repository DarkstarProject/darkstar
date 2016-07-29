-----------------------------------
-- Area: Port Bastok
-- NPC: Jabbar
-- Type: Tenshodo Merchant
-- Involved in Quests: Tenshodo Menbership
-- @pos -99.718 -2.299 26.027 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(TENSHODO_MEMBERS_CARD)) then 
        if (player:sendGuild(60419, 1, 23, 4)) then 
            player:showText(npc,TENSHODO_SHOP_OPEN_DIALOG);
        end
    elseif (player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(TENSHODO_APPLICATION_FORM)) then
            player:startEvent(0x0098);
        else
            player:startEvent(0x0097);
        end
    else
        player:startEvent(0x0096);
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
        player:addKeyItem(TENSHODO_APPLICATION_FORM);
        player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_APPLICATION_FORM);
    end
end;