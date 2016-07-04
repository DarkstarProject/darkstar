-----------------------------------
-- Area: Crawlers Nest
-- NPC:  ???
-- Involved in Quest: The Crimson Trial
-- @pos 59 0.1 66 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local cprog = player:getVar("theCrimsonTrial_prog");
    local cdate = player:getVar("theCrimsonTrial_date");
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    
    if (player:hasKeyItem(CRAWLER_BLOOD) == true and player:hasKeyItem(OLD_BOOTS) == true) then
        player:startEvent(4);
    elseif (cprog == 1 and cdate == realday) then
        player:messageSpecial(EQUIPMENT_COMPLETELY_PURIFIED);
    elseif (cprog == 1 and cdate ~= realday) then
        player:startEvent(5);
    else
        player:messageSpecial(SOMEONE_HAS_BEEN_DIGGING_HERE);
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

    if (csid == 4 and option == 1) then
        player:delKeyItem(CRAWLER_BLOOD);
        player:delKeyItem(OLD_BOOTS);
        player:setVar("theCrimsonTrial_date", os.date("%j")); -- %M for next minute, %j for next day
        player:setVar("theCrimsonTrial_prog", 1);
        player:messageSpecial(YOU_BURY_THE,OLD_BOOTS,CRAWLER_BLOOD);
    elseif (csid == 5) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14093); -- Warlock's Boots
        else
            player:addItem(14093);
            player:messageSpecial(ITEM_OBTAINED, 14093); -- Warlock's Boots
            player:setVar("theCrimsonTrial_date",0);
            player:setVar("theCrimsonTrial_prog",0);
            player:setVar("needs_crawler_blood",2); -- Fixed being unable start next quest
            player:addFame(SANDORIA,AF2_FAME);
            player:completeQuest(SANDORIA,ENVELOPED_IN_DARKNESS);
        end
    end

end;
