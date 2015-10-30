-----------------------------------
-- Area: 
-- NPC:  Airship_Door 
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Sealions_Den/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)  
    if (npc:getID() == 16908420) then -- First door..
        player:startEvent(0x7D03, 1);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    local mammet_1_1    = GetMobAction(16908289);
    local mammet_1_2    = GetMobAction(16908290);
    local mammet_1_3    = GetMobAction(16908291);
    local mammet_1_4    = GetMobAction(16908292);
    local mammet_1_5    = GetMobAction(16908293);
    local omega1        = GetMobAction(16908294);
    local ultima1       = GetMobAction(16908295);
    
    if (csid == 0x7D03 and option == 100) then
    
        -- Are any mammets alive still..
        if (mammet_1_1 > 0 or mammet_1_2 > 0 or mammet_1_3 > 0 or mammet_1_4 > 0 or mammet_1_5 > 0) then
            player:startEvent(0x0000, 1);
            
        -- Is Omega alive..
        elseif (omega1 > 0) then
            player:startEvent(0x0001, 1);
            
        -- Is Ultima alive..
        elseif (ultima1 > 0) then
            player:startEvent(0x0002, 1);
        end
    end
    
end;