-----------------------------------
-- Area: Windurst Walls
--  Door: Priming Gate
--  Involved in quest: Toraimarai Turmoil
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    X = player:getXPos();
    Z = player:getZPos();

    if ((X >= 1.51 and X <= 9.49) and (Z >= 273.1 and Z <= 281)) then
        if player:hasKeyItem(267) then
            player:startEvent(401);
        else player:startEvent (0x0108);
        end
    else
        player:startEvent (0x018b);
    end
    return 1
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

