-----------------------------------
-- Area: Garlaige Citadel
--  NPC: qm13 (???)
-- Involved in Quest: Hitting the Marquisate (THF AF3)
-- !pos -194.166 -5.500 139.969 200
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Garlaige_Citadel/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local hittingTheMarquisateHagainCS = player:getVar("hittingTheMarquisateHagainCS");

    if (hittingTheMarquisateHagainCS == 5) then
        player:messageSpecial(ID.text.PRESENCE_FROM_CEILING);
        player:setVar("hittingTheMarquisateHagainCS",6);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
end;
