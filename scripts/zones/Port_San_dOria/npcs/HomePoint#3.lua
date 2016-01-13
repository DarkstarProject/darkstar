-----------------------------------
-- Area: Port San dOria
--  NPC: HomePoint#3
-- @pos -6 -13 -150 232
require("scripts/globals/settings");
local text = require("scripts/zones/Port_San_dOria/TextIDs");
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

    homepointMenu( player, 0x21fe, 8);
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

    if (csid == 0x21fe) then

        if (option == 1) then    
            player:setHomePoint();
            player:messageSpecial(text.HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;