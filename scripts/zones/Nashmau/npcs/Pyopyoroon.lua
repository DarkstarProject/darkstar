-----------------------------------
-- Area: Nashmau
-- NPC: Pyopyoroon
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
require("scripts/globals/missions");
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
-----------------------------------


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
if (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("TOAUM12") == 1 and trade:hasItemQty(2307,1))
then player:startEvent(0x0117);
end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("TOAUM12") ==0) then
        player:startEvent(0x0115);
    elseif (player:getCurrentMission(TOAU) == ROYAL_PUPPETEER and player:getVar("TOAUM12") == 1) then
        player:startEvent(0x0116);
    elseif (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        player:startEvent(0x0118);
    else
        player:startEvent(0x0113);
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
    if (csid == 0x0115) then
        player:setVar("TOAUM12",1);
    elseif (csid == 0x0117 and player:getVar("TOAUM12") == 1) then
        player:setVar("TOAUM12",0);
        player:tradeComplete();
        player:addKeyItem(VIAL_OF_SPECTRAL_SCENT);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SPECTRAL_SCENT);
        player:completeMission(TOAU,ROYAL_PUPPETEER);
        player:addMission(TOAU,LOST_KINGDOM);
    end
 end;



