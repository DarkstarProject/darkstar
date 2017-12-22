-----------------------------------
-- Area: Windurst Waters
-- NPC:  Churano-Shurano
-- Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(MAGICKED_ASTROLABE) == false) then
        local cost = 10000;
        if (player:getVar("Astrolabe") == 0) then
            player:startEvent(1080, cost);
        else
            player:startEvent(1081, cost);
        end
    else
        player:startEvent(280);
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
    if (csid == 1080 and option == 1) then
        player:setVar("Astrolabe", 1);
    elseif (csid == 1081 and option == 1 and player:delGil(10000)) then
        player:messageSpecial(KEYITEM_OBTAINED,MAGICKED_ASTROLABE);
        player:addKeyItem(MAGICKED_ASTROLABE);
    end
end;



