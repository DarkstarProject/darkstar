-----------------------------------
-- Area: Upper Delkfutt's Tower
--  NPC: HomePoint#1
-- !pos -365 -176.5 -36 158
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Upper_Delkfutts_Tower/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 71);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;