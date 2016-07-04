-----------------------------------
-- Area: Port Windurst
-- NPC:  Honorio
-- @zone 240
-- @pos 218 -5 114
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
    
    if (player:hasKeyItem(AIRSHIP_PASS) == true and player:getGil() >= 200) then 
        player:startEvent(0x00b5,0,8,0,0,0,0,0,200);
    else
        player:startEvent(0x00b7,0,8);
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

    if (csid == 0x00b5) then 
        X = player:getXPos();
        
        if (X >= 222 and X <= 225) then
            player:delGil(200);
        end
    end

end;



