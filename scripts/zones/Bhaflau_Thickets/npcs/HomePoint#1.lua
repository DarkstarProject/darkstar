-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: HomePoint#1
-- !pos  -98 -10 -493 52
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 74);
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