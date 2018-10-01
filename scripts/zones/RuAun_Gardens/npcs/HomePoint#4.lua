-----------------------------------
-- Area: RuAun_Gardens
--  NPC: HomePoint#4
-- !pos 500 -42 158 130
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/RuAun_Gardens/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8703, 62);
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