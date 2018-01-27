-----------------------------------
-- Area: Rabao
--  NPC: Maryoh Comyujah
-- Involved in Mission: The Mithra and the Crystal (Zilart 12)
-- !pos 0 8 73 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL) then
        if (player:getVar("ZilartStatus") == 0) then
            player:startEvent(81); -- Start
        elseif (player:hasKeyItem(SCRAP_OF_PAPYRUS)) then
            player:startEvent(83); -- Finish
        elseif (player:getVar("ZilartStatus") == 2) then
            player:startEvent(84); -- Go to hall of the gods
        else
            player:startEvent(82);
        end
    elseif (player:hasCompletedMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL)) then
        player:startEvent(85); -- New standard dialog after ZM12
    else
        player:startEvent(43); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 81 and option == 1) then
        player:setVar("ZilartStatus",1);
    elseif (csid == 83) then
        player:setVar("ZilartStatus",2);
        player:delKeyItem(SCRAP_OF_PAPYRUS);
        player:addKeyItem(CERULEAN_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,CERULEAN_CRYSTAL);
    end

end;