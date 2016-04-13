-----------------------------------
-- Area: Nashmau
--  NPC: Pyopyoroon
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 1 and trade:hasItemQty(2307,1)) then
        player:startEvent(279);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(277);
    elseif (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(278);
    elseif (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        player:startEvent(280);
    else
        player:startEvent(275);
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
    if (csid == 277) then
        player:setVar("AhtUrganStatus",1);
    elseif (csid == 279 and player:getVar("AhtUrganStatus") == 1) then
        player:setVar("AhtUrganStatus",0);
        player:tradeComplete();
        player:addKeyItem(VIAL_OF_SPECTRAL_SCENT);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SPECTRAL_SCENT);
        player:completeMission(TOAU,ROYAL_PUPPETEER);
        player:addMission(TOAU,LOST_KINGDOM);
    end
end;
