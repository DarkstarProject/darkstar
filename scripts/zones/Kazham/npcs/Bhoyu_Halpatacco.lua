-----------------------------------
-- Area: Kazham
-- NPC:  Bhoyu Halpatacco
-- @zone 250
-- @pos -18 -4 -15
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    Z = player:getZPos();
    
    if (Z >= -11 and Z <= -6) then
        player:startEvent(0x0043);
    elseif (player:getGil() >= 200) then
        player:startEvent(0x0074,0,200);
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

    if (csid == 0x0074) then 
        Z = player:getZPos();
        
        if (Z >= -10 and Z <= -6) then
            player:delGil(200);
        end
    end

end;



