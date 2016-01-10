-----------------------------------
-- Area: Windurst Woods
--  NPC: HomePoint#2
-- @pos 107 -5 -56 241
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/homepoint");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    homepointMenu( player, 0x21fd, 26);
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

    if (csid == 0x21fd) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(text.text.HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;
