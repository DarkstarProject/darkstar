-----------------------------------
--  Area: The Boyahda Tree
--  NPC:  Mandragora Warden
--  Type: Mission NPC
--  @pos 81.981 7.593 139.556 153
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and (MissionStatus == 4 or MissionStatus == 5)) then
        if (trade:hasItemQty(1181,1) == true) and (trade:getItemCount() == 1) then 
            player:startEvent(0x000D);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

local MissionStatus = player:getVar    ("MissionStatus");
local dialog = player:getVar ("mandialog");
    if (MissionStatus == 4) then
        if (dialog == 0) then
            player:startEvent(0x000a);
            player:setVar("mandialog",1);
            player:PrintToPlayer("Seems like he wants something");
        elseif (dialog == 1) then
            player:startEvent(0x000b);
            player:setVar("mandialog",2);
        elseif (dialog == 2) then
            player:startEvent(0x000c);
            player:setVar("mandialog",3);
            player:PrintToPlayer("Seems like he wants some Gobbu Hummus");
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
    if (csid == 0x000D) then
        player:setVar("MissionStatus",6);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_ZONPAZIPPA);
        player:addKeyItem(LETTER_FROM_ZONPAZIPPA);
    end
end;

