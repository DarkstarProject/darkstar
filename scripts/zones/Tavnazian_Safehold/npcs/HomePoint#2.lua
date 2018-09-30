-----------------------------------
-- Area: Tavnazian_Safehold
--  NPC: HomePoint#2
-- !pos 14 -9.96 -5 26
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Tavnazian_Safehold/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8701, 120);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8701) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;