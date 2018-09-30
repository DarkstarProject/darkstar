-----------------------------------
-- Area: Xarcabard [S]
--  NPC: HomePoint#1
-- !pos  223 -13 -254 137
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Xarcabard_[S]/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 111);
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