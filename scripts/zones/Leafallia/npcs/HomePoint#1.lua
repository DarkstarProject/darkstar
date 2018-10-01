-----------------------------------
-- Area: Leafallia
--  NPC: HomePoint#1
-- !pos 5.539 -0.434 8.133 281
-----------------------------------
local ID = require("scripts/zones/Leafallia/IDs")
require("scripts/globals/homepoint")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 112);
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