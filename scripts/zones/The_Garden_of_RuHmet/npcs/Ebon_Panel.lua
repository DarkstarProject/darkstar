-----------------------------------
-- Area: The Garden of RuHmet
--  NPC: Ebon_Panel
-- !pos 100.000 -5.180 -337.661 35 | Mithra Tower
-- !pos 740.000 -5.180 -342.352 35 | Elvaan Tower
-- !pos 257.650 -5.180 -699.999 35 | Tarutaru Tower
-- !pos 577.648 -5.180 -700.000 35 | Galka Tower
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Race = player:getRace();
    local xPos = npc:getXPos();

    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(202);
    elseif (player:getCurrentMission(COP) == WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus") == 2) then
        if (xPos > 99 and xPos < 101) then -- Mithra Tower
            if ( Race==7 ) then
                player:startEvent(124);
            else
                player:messageSpecial(NO_NEED_INVESTIGATE);
            end
        elseif (xPos > 739 and xPos < 741) then -- Elvaan Tower
            if ( Race==3 or Race==4) then
                player:startEvent(121);
            else
                player:messageSpecial(NO_NEED_INVESTIGATE);
            end
        elseif (xPos > 256 and xPos < 258) then -- Tarutaru Tower
            if ( Race==5 or Race==6  ) then
                player:startEvent(123);
            else
                player:messageSpecial(NO_NEED_INVESTIGATE);
            end
        elseif (xPos > 576 and xPos < 578) then -- Galka Tower
            if ( Race==8) then
                player:startEvent(122);
            else
                player:messageSpecial(NO_NEED_INVESTIGATE);
            end
        end
    else
        player:messageSpecial(NO_NEED_INVESTIGATE);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 202) then
        player:setVar("PromathiaStatus",2);
    elseif (124 and option ~=0) then -- Mithra
        player:addTitle(WARRIOR_OF_THE_CRYSTAL);
        player:setVar("PromathiaStatus",3);
        player:addKeyItem(LIGHT_OF_DEM);
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_DEM);
    elseif (121 and option ~=0) then -- Elvaan
        player:addTitle(WARRIOR_OF_THE_CRYSTAL);
        player:setVar("PromathiaStatus",3);
        player:addKeyItem(LIGHT_OF_MEA);
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_MEA);
    elseif (123 and option ~=0) then -- Tarutaru
        player:addTitle(WARRIOR_OF_THE_CRYSTAL);
        player:setVar("PromathiaStatus",3);
        player:addKeyItem(LIGHT_OF_HOLLA);
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_HOLLA);
    elseif (122 and option ~=0) then -- Galka
        player:addTitle(WARRIOR_OF_THE_CRYSTAL);
        player:setVar("PromathiaStatus",3);
        player:addKeyItem(LIGHT_OF_ALTAIEU);
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_ALTAIEU);
    end
end;