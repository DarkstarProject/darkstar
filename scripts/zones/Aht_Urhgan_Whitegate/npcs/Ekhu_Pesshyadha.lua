-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Ekhu Pesshyadha
--  Type: Standard NPC
-- !pos -13.043 0.999 103.423 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local gotItAllProg = player:getVar("gotitallCS");
    if (gotItAllProg == 1) then
       player:startEvent(537);
    elseif (gotItAllProg == 2) then
       player:startEvent(536);
    elseif (gotItAllProg == 3) then
       player:startEvent(524);
    elseif (player:getQuestStatus(AHT_URHGAN,GOT_IT_ALL) == QUEST_COMPLETED) then
       player:startEvent(531);
    else
       player:startEvent(532);
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
    if (csid == 537) then
       player:setVar("gotitallCS",2);
    elseif (csid == 524) then
       player:addKeyItem(VIAL_OF_LUMINOUS_WATER);
       player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_LUMINOUS_WATER);
       player:setVar("gotitallCS",4);
    end
end;

