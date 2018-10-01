-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Signpost
-- !pos -221 17 139 108
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.SIGNPOST3);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
end;