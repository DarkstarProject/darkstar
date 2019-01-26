-----------------------------------
-- Area: Ordelles Caves
--  NPC: Ruillont
-- Involved in Mission: The Rescue Drill
-- !pos -70 1 607 193
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Ordelles_Caves/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL and player:getVar("MissionStatus") == 9) then
        if (trade:hasItemQty(16535,1) and trade:getItemCount() == 1) then -- Trade Bronze Sword
            player:startEvent(2);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
        local MissionStatus = player:getVar("MissionStatus");

        if (MissionStatus == 7) then
            player:startEvent(1);
        elseif (MissionStatus >= 10 or player:hasCompletedMission(SANDORIA,THE_RESCUE_DRILL)) then
            player:showText(npc, ID.text.RUILLONT_INITIAL_DIALOG + 9);
        elseif (MissionStatus >= 8) then
            player:showText(npc, ID.text.RUILLONT_INITIAL_DIALOG);
        elseif (player:getNation() == dsp.nation.SANDORIA) then
            player:showText(npc, ID.text.RUILLONT_INITIAL_DIALOG + 2);
        else
            player:showText(npc, ID.text.RUILLONT_INITIAL_DIALOG + 1);
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 1) then
        local rand = math.random(1,3);

        player:setVar("theRescueDrillRandomNPC",rand);
        player:setVar("MissionStatus",8);
    elseif (csid == 2) then
        player:tradeComplete();
        player:setVar("MissionStatus",10);
    end

end;