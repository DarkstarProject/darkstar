-----------------------------------
-- Area: Bastok_Markets_[S]
--  NPC: HomePoint#1
-- !pos -293.048 -10.000 -102.558 87
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 69);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;