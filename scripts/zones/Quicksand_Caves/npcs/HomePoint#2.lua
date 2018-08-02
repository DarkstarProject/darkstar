-----------------------------------
-- Area: Quicksand_Caves
--  NPC: HomePoint#2
-- !pos  573 9 -500 208
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Quicksand_Caves/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8701, 96);
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