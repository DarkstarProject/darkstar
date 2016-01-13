-----------------------------------
-- Area: Uleguerand_Range
--  NPC: HomePoint#5
-- @pos 
require("scripts/globals/settings");
local text = require("scripts/zones/Uleguerand_Range/TextIDs");
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

    homepointMenu( player, 0x2200, 80);
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

    if (csid == 0x2200) then

        if (option == 1) then    
            player:setHomePoint();
            player:messageSpecial(text.HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;