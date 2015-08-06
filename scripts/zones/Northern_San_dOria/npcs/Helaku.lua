-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Helaku
-- Involved in Missions 2-3
-- @zone 231
-- @pos 49 -2 -12
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Northern_San_dOria/TextIDs");

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

    if (pNation == (BASTOK)) then 
        -- Bastok Mission 2-3 Part II - Windurst > San d'Oria 
        if (currentMission == THE_EMISSARY_WINDURST2 and MissionStatus == 11) then
            player:startEvent(0x022d);
        elseif (currentMission == THE_EMISSARY_WINDURST2 and MissionStatus == 10 and player:hasKeyItem(KINDRED_CREST)) then
            player:startEvent(0x0221);
        elseif (currentMission == THE_EMISSARY_WINDURST2 and MissionStatus == 7) then
            player:startEvent(0x0219);
        -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
        elseif (currentMission == THE_EMISSARY_SANDORIA and MissionStatus == 5) then
            player:startEvent(0x021f);
        elseif (currentMission == THE_EMISSARY_SANDORIA and MissionStatus <= 4) then
            player:startEvent(0x021e);
        elseif (currentMission == THE_EMISSARY_SANDORIA and MissionStatus == 3) then
            player:showText(npc,HELAKU_DIALOG);
        elseif (currentMission == THE_EMISSARY and MissionStatus == 2) then
            player:startEvent(0x0218);
        elseif (currentMission == THE_EMISSARY and MissionStatus == 1) then
            player:startEvent(0x02a4);
        end
    else
        player:startEvent(0x021d);
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

    if (csid == 0x0218) then
        player:addMission(BASTOK,THE_EMISSARY_SANDORIA);
        player:setVar("MissionStatus",3);
    elseif (csid == 0x021f) then
        player:addMission(BASTOK,THE_EMISSARY_SANDORIA2);
        player:setVar("MissionStatus",6);
    elseif (csid == 0x0219 and option == 0) then
        player:setVar("MissionStatus",8);
    elseif (csid == 0x0221) then
        player:setVar("MissionStatus",11);
        player:addKeyItem(KINDRED_REPORT);
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
        player:delKeyItem(KINDRED_CREST);
    end
end;