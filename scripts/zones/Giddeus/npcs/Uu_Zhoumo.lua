-----------------------------------
-- Area: Giddeus
-- NPC:  Uu Zhoumo
-- Involved in Mission 2-3
-- !pos -179 16 155 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getCurrentMission(BASTOK) == THE_EMISSARY_WINDURST and trade:hasItemQty(16509,1) and trade:getItemCount() == 1) then -- Trade Aspir Knife
        player:startEvent(41);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(SHIELD_OFFERING)) then
        player:startEvent(42);
    elseif (player:getCurrentMission(BASTOK) == THE_EMISSARY_WINDURST) then
        if (player:hasKeyItem(DULL_SWORD)) then
            player:startEvent(40);
        elseif (player:getVar("MissionStatus") == 5) then
            player:startEvent(43);
        else
            player:startEvent(44);
        end
    else
        player:startEvent(44);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 40) then
        player:setVar("MissionStatus",5);
        player:delKeyItem(DULL_SWORD);
    elseif (csid == 41) then
        player:tradeComplete();
        player:setVar("MissionStatus",6);
    elseif (csid == 42) then
        player:setVar("MissionStatus",6);
        player:delKeyItem(SHIELD_OFFERING);
    end
end;

