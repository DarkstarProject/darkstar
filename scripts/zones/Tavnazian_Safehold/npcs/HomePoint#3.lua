-----------------------------------
-- Area: Tavnazian_Safehold
--  NPC: HomePoint#3
-- !pos 73.59 -36.149 38.87 26
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Tavnazian_Safehold/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8702, 121);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8702) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;