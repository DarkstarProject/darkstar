-----------------------------------
-- Area: Giddeus
-- NPC:  Ghoo Pakya
-- Involved in Mission 1-3
-- @pos -139 0 147 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
        if (player:hasKeyItem(DRINK_OFFERINGS)) then
            -- We have the offerings
            player:startEvent(0x0031);
        else
            if (player:getVar("ghoo_talk") == 1) then
                -- npc: You want your offering back?
                player:startEvent(0x0032);
            elseif (player:getVar("ghoo_talk") == 2) then
                -- npc: You'll have to crawl back to treasure chamber, etc
                player:startEvent(0x0033);
            else
                -- We don't have the offerings yet or anymore
                player:startEvent(0x0034);
            end
        end
    else
        player:startEvent(0x0034);
    end
    
end
    
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
    
    if (csid == 0x0031) then
        player:delKeyItem(DRINK_OFFERINGS);
        player:setVar("ghoo_talk",1);
        
        if (player:hasKeyItem(FOOD_OFFERINGS) == false) then
            player:setVar("MissionStatus",2);
        end
    elseif (csid == 0x0032) then
        player:setVar("ghoo_talk",2);
    end
    
end;