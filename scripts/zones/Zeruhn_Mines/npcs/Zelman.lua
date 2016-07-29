-----------------------------------
--    Area: Zeruhn Mines
--    NPC:  Zelman
--    Involved In Quest: Groceries
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local GroceriesVar = player:getVar("Groceries");
    local GroceriesViewedNote = player:getVar("GroceriesViewedNote");

    if (GroceriesVar == 2) then
        player:showText(npc,7279);
    elseif (GroceriesVar == 1) then
        ViewedNote = player:seenKeyItem(TAMIS_NOTE);
        if (ViewedNote == true) then
            player:startEvent(0x00a2);
        else
            player:startEvent(0x00a1);
        end
    else
        player:startEvent(0x00a0);
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

    if (csid == 0x00a1) then
        player:setVar("Groceries",2);
        player:delKeyItem(TAMIS_NOTE);
    elseif (csid == 0x00a2) then
        player:setVar("GroceriesViewedNote",1);
        player:delKeyItem(TAMIS_NOTE);
    end
    
end;




