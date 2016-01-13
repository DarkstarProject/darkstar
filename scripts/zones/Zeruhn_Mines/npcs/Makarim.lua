-----------------------------------
-- Area: Zeruhn Mines
--  NPC: Makarim
-- Involved In Mission: The Zeruhn Report
-- @pos -58 8 -333 172
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local text = require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == THE_ZERUHN_REPORT) then
        if (player:hasKeyItem(ZERUHN_REPORT)) then
            player:messageSpecial(text.MAKARIM_DIALOG_I);
        else
            player:startEvent(0x0079);
        end
    else
        player:startEvent(0x0068);
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

    if (csid == 0x0079) then
        player:addKeyItem(ZERUHN_REPORT);
        player:messageSpecial(text.KEYITEM_OBTAINED,ZERUHN_REPORT);
    end
    
end;