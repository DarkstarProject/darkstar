-----------------------------------
-- Area: Misareaux Coast
--  NPC: HomePoint#1
-- @pos -65 -17.5 563 25
require("scripts/globals/settings");
local text = require("scripts/zones/Misareaux_Coast/TextIDs");
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

    homepointMenu( player, 0x21fd, 25);
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
            player:messageSpecial(text.HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;