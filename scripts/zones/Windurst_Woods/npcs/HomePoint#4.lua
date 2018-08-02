-----------------------------------
-- Area: Windurst Woods
--  NPC: HomePoint#4
-- !pos 74 -7.5 -139 241
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Windurst_Woods/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8703, 28);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8703) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;