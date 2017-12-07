-----------------------------------
-- Area: Port Windurst
-- NPC:  Gold Skull
-- Mission NPC
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
    
    if (player:getCurrentMission(BASTOK) ~= 255) then
        currentMission = player:getCurrentMission(BASTOK);
        missionStatus = player:getVar("MissionStatus");

        if (player:hasKeyItem(SWORD_OFFERING)) then
            player:startEvent(53);
        elseif (player:hasKeyItem(KINDRED_REPORT)) then
            player:startEvent(68);
        elseif (currentMission == THE_EMISSARY_WINDURST2) then
            if (missionStatus == 7) then
                player:startEvent(62);
            elseif (missionStatus == 8) then
                player:showText(npc,GOLD_SKULL_DIALOG + 27);
            elseif (missionStatus == 9) then
                player:startEvent(57);
            end
        elseif (currentMission == THE_EMISSARY_WINDURST) then
            if (missionStatus == 2) then
                player:startEvent(50);
            elseif (missionStatus == 12) then
                player:startEvent(54);
            elseif (missionStatus == 14) then
                player:showText(npc,GOLD_SKULL_DIALOG);
            elseif (missionStatus == 15) then
                player:startEvent(57);
            end
        else
            player:startEvent(43);
        end
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

    if (csid == 53) then
        player:addKeyItem(DULL_SWORD);
        player:messageSpecial(KEYITEM_OBTAINED,DULL_SWORD);
        player:delKeyItem(SWORD_OFFERING);
    end
    
end;