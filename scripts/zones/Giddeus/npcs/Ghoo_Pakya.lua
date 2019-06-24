-----------------------------------
-- Area: Giddeus
--  NPC: Ghoo Pakya
-- Involved in Mission 1-3
-- !pos -139 0 147 145
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_PRICE_OF_PEACE) then
        if (player:hasKeyItem(dsp.ki.DRINK_OFFERINGS)) then
            -- We have the offerings
            player:startEvent(49);
        else
            if (player:getVar("ghoo_talk") == 1) then
                -- npc: You want your offering back?
                player:startEvent(50);
            elseif (player:getVar("ghoo_talk") == 2) then
                -- npc: You'll have to crawl back to treasure chamber, etc
                player:startEvent(51);
            else
                -- We don't have the offerings yet or anymore
                player:startEvent(52);
            end
        end
    else
        player:startEvent(52);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 49) then
        player:delKeyItem(dsp.ki.DRINK_OFFERINGS);
        player:setVar("ghoo_talk",1);

        if (player:hasKeyItem(dsp.ki.FOOD_OFFERINGS) == false) then
            player:setVar("MissionStatus",2);
        end
    elseif (csid == 50) then
        player:setVar("ghoo_talk",2);
    end

end;