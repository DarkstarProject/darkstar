-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ???
-- Involved in Mission: Bastok 8-2
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Kuftal_Tunnel/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER) then
        if (player:getVar("MissionStatus") == 2) then
            player:messageSpecial(EVIL);
            SpawnMob(17489926, 180); -- Gordov's Ghost
            SpawnMob(17489927, 180); -- Dervo's Ghost
            SpawnMob(17489928, 180); -- Gizerl's Ghost

        elseif (player:getVar("MissionStatus") == 3) then
            player:startEvent(13);
        else
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 13) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(OLD_PIECE_OF_WOOD);
        player:messageSpecial(KEYITEM_OBTAINED,OLD_PIECE_OF_WOOD);
    end

end;