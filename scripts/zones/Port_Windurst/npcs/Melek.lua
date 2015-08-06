-----------------------------------
-- Area: Port Windurst
-- NPC:  Melek
-- Involved in Mission 2-3
-- @zone 240
-- @pos -80 -5 158
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
	
    if (pNation == BASTOK) then
        -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
        if (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 7) then
            player:showText(npc,MELEK_DIALOG_C)
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 6) then
            player:startEvent(0x0037);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus <= 5) then
            player:showText(npc,MELEK_DIALOG_B)
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 3 and player:hasKeyItem(SWORD_OFFERING)) then
            player:startEvent(0x0035);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 2) then
            player:startEvent(0x0031);			
        elseif (currentMission == THE_EMISSARY and MissionStatus == 1) then
            player:startEvent(0x0030);		
        -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 10 and player:hasKeyItem(KINDRED_REPORT)) then
            player:startEvent(0x0043);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 9 and player:hasKeyItem(KINDRED_CREST)) then
            player:startEvent(0x0042);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 8) then
            player:showText(npc,MELEK_DIALOG_A);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 7) then
            player:startEvent(0x0040);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 6) then
            player:startEvent(0x003D);
        end
    else
        player:startEvent(0x002a);
    end
end;
-- Melek 0x0029  0x002a  0x0030  0x0031  0x0035  0x0037  0x0038  0x003d  0x0040  0x0042  0x0043
-- Gold Skull 0x002b  0x0030  0x0032  0x0035  0x0036  0x0039  0x003d  0x003e  0x0042  0x0044
-- Ada 0x002c  0x002f  0x0033  0x003a  0x003f  0x0045
-- Josef 0x002d  0x0034  0x003b  0x003c  0x0041  0x0046
-- Calixte 0x002e
--Sachetan, I.M. 0x7ff9

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
	
    if (csid == 0x0030) then
        player:addMission(BASTOK,THE_EMISSARY_WINDURST);
        player:setVar("MissionStatus",2);
        player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
    elseif (csid == 0x0037) then
        player:addMission(BASTOK,THE_EMISSARY_WINDURST2);
        player:setVar("MissionStatus",7); -- to Sandy now
    elseif (csid == 0x003d) then
        player:setVar("MissionStatus",7);
    elseif (csid == 0x0042) then
        player:addKeyItem(KINDRED_REPORT)
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
        player:setVar("MissionStatus",10);  -- return to Bastok
        player:delKeyItem(KINDRED_CREST)
    end
end;