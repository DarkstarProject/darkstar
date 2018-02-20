-----------------------------------
-- Area: Giddeus
--  NPC: Laa Mozi
-- Involved in Mission 1-3
-- !pos -22 0 148 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Giddeus/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
        if (player:hasKeyItem(FOOD_OFFERINGS)) then
            -- We have the offerings
            player:startEvent(45);
        else
            if (player:getVar("laa_talk") == 1) then
                -- npc: You want your offering back?
                player:startEvent(46);
            elseif (player:getVar("laa_talk") == 2) then
                -- npc: You'll have to crawl back to treasure chamber, etc
                player:startEvent(47);
            else
                -- We don't have the offerings yet or anymore
                player:startEvent(48);
            end
        end
    else
        player:startEvent(48);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 45) then
        player:delKeyItem(FOOD_OFFERINGS);
        player:setVar("laa_talk",1);

        if (player:hasKeyItem(DRINK_OFFERINGS) == false) then
            player:setVar("MissionStatus",2);
        end
    elseif (csid == 46) then
        player:setVar("laa_talk",2);
    end

end;