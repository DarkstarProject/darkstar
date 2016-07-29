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
    
    pNation = player:getNation();
    
    if (player:getCurrentMission(BASTOK) ~= 255) then
        currentMission = player:getCurrentMission(pNation);

        if (pNation == BASTOK) then
            missionStatus = player:getVar("MissionStatus");
            if (currentMission == THE_EMISSARY) then
                -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
                if (missionStatus == 1) then
                    player:startEvent(0x0030);
                elseif (missionStatus == 7) then
                    player:showText(npc,MELEK_DIALOG_C)
                -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
                elseif (missionStatus == 6) then
                    player:startEvent(0x003D);
                elseif (player:hasKeyItem(KINDRED_REPORT)) then
                    player:startEvent(0x0043);
                end
            -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
            elseif (currentMission == THE_EMISSARY_WINDURST) then
                if (missionStatus == 2) then
                    player:startEvent(0x0031);
                elseif (player:hasKeyItem(SWORD_OFFERING)) then
                player:startEvent(0x0035);
                elseif (missionStatus <= 5) then
                    player:showText(npc,MELEK_DIALOG_B)
                elseif (missionStatus == 6) then
                    player:startEvent(0x0037);
                end
            -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
            elseif (currentMission == THE_EMISSARY_WINDURST2) then
                if (missionStatus == 7) then
                    player:startEvent(0x0040);
                elseif (missionStatus == 8) then
                    player:showText(npc,MELEK_DIALOG_A)
                elseif (player:hasKeyItem(KINDRED_CREST)) then
                    player:startEvent(0x0042);
                end
            else
                player:startEvent(0x002a);
            end
        end
    else
        player:startEvent(0x002a);
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
    
    if (csid == 0x0030) then
        player:addMission(BASTOK,THE_EMISSARY_WINDURST);
        player:setVar("MissionStatus",2);
        player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
    elseif (csid == 0x0035) then
        player:addKeyItem(DULL_SWORD)
        player:messageSpecial(KEYITEM_OBTAINED,DULL_SWORD);
        player:setVar("MissionStatus",4);  --> Gideus next
        player:delKeyItem(SWORD_OFFERING) -- remove sword offering
    elseif (csid == 0x0037) then
        player:addMission(BASTOK,THE_EMISSARY);
        player:setVar("MissionStatus",7); -- to Sandy now
    elseif (csid == 0x003d) then
        player:addMission(BASTOK,THE_EMISSARY_WINDURST2);
        player:setVar("MissionStatus",7);
    elseif (csid == 0x0042) then
        player:addMission(BASTOK,THE_EMISSARY);
        player:addKeyItem(KINDRED_REPORT)
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
        player:setVar("MissionStatus",10);  -- return to Bastok
        player:delKeyItem(KINDRED_CREST)
    end
    
end;