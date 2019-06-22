-----------------------------------
-- Area: Davoi
--  NPC: Disused Well
-- Involved in Quest: A Knight's Test
-- !pos -221 2 -293 149
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.KNIGHTS_SOUL) == false and player:hasKeyItem(dsp.ki.BOOK_OF_TASKS) and player:hasKeyItem(dsp.ki.BOOK_OF_THE_WEST) and player:hasKeyItem(dsp.ki.BOOK_OF_THE_EAST)) then
        player:addKeyItem(dsp.ki.KNIGHTS_SOUL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.KNIGHTS_SOUL);
    else
        player:messageSpecial(ID.text.A_WELL);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;