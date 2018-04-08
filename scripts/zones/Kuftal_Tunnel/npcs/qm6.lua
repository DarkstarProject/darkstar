-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ???
-- Involved in Mission: Bastok 8-2
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    
    -- ENTER THE TALEKEEPER
    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER) then
        local missionStatus = player:getVar("MissionStatus");        
        local anyGhostsAlive = false;
        for i = 0, 2 do
            if (GetMobByID(TALEKEEPER_OFFSET + i):isAlive()) then
                anyGhostsAlive = true;
                break;
            end
        end
        
        if (player:getVar("MissionStatus") == 2 and not anyGhostsAlive) then
            player:messageSpecial(EVIL);
            for i = 0, 2 do
                SpawnMob(TALEKEEPER_OFFSET + i);
            end
        elseif (player:getVar("MissionStatus") == 3 and not anyGhostsAlive) then
            player:startEvent(13);
        else
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        end

    -- DEFAULT DIALOG
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 13) then
        player:setVar("MissionStatus",4);
        npcUtil.giveKeyItem(player, OLD_PIECE_OF_WOOD);
    end
end;
