-----------------------------------
-- Area: Port Bastok
--  NPC: Jabbar
-- Type: Tenshodo Merchant
-- Involved in Quests: Tenshodo Menbership
-- !pos -99.718 -2.299 26.027 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.TENSHODO_MEMBERS_CARD)) then
        if (player:sendGuild(60419, 1, 23, 4)) then
            player:showText(npc,TENSHODO_SHOP_OPEN_DIALOG);
        end
    elseif (player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.TENSHODO_APPLICATION_FORM)) then
            player:startEvent(152);
        else
            player:startEvent(151);
        end
    else
        player:startEvent(150);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 151) then
        player:addKeyItem(dsp.ki.TENSHODO_APPLICATION_FORM);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TENSHODO_APPLICATION_FORM);
    end
end;