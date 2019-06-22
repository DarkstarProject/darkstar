-----------------------------------
-- Area: Nashmau
--  NPC: Pyopyoroon
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getCurrentMission(TOAU) == dsp.mission.id.toau.ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 1 and trade:hasItemQty(2307,1)) then
        player:startEvent(279);
    end
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == dsp.mission.id.toau.ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(277);
    elseif (player:getCurrentMission(TOAU) == dsp.mission.id.toau.ROYAL_PUPPETEER and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(278);
    elseif (player:getCurrentMission(TOAU) == dsp.mission.id.toau.LOST_KINGDOM) then
        player:startEvent(280);
    else
        player:startEvent(275);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 277) then
        player:setVar("AhtUrganStatus",1);
    elseif (csid == 279 and player:getVar("AhtUrganStatus") == 1) then
        player:setVar("AhtUrganStatus",0);
        player:tradeComplete();
        player:addKeyItem(dsp.ki.VIAL_OF_SPECTRAL_SCENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.VIAL_OF_SPECTRAL_SCENT);
        player:completeMission(TOAU,dsp.mission.id.toau.ROYAL_PUPPETEER);
        player:addMission(TOAU,dsp.mission.id.toau.LOST_KINGDOM);
    end
end;
