-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Iruki-Waraki
--  Type: Standard NPC
--  Involved in quest: No Strings Attached
--  @pos 101.329 -6.999 -29.042 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
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

local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");
    if (NoStringsAttached == 1 and NoStringsAttachedProgress == 1) then
        player:startEvent(0x0104); -- he tells u to get him an automaton
    elseif (NoStringsAttached == 1 and NoStringsAttachedProgress == 2) then
        player:startEvent(0x0105); -- reminder to get an automaton
    elseif (NoStringsAttached == 1 and NoStringsAttachedProgress == 6) then
        player:startEvent(0x010a); -- you bring him the automaton
    elseif (NoStringsAttached == 2) then
        player:startEvent(0x010b); -- asking you how are you doing with your automaton
        -- In case a player completed the quest before unlocking attachments was implemented (no harm in doing this repeatedly)
        player:unlockAttachment(8224); --Harlequin Frame
        player:unlockAttachment(8193); --Harlequin Head
    else
        player:startEvent(0x0103); -- Leave him alone
    end;
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
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);

    if (csid == 0x0104) then
        player:setVar("NoStringsAttachedProgress",2);
    elseif (csid == 0x010a) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:completeQuest(AHT_URHGAN,NO_STRINGS_ATTACHED);
            player:addTitle(PROUD_AUTOMATON_OWNER);
            player:unlockJob(18);
            player:addItem(17859);
            player:messageSpecial(ITEM_OBTAINED,17859); -- animator
            player:messageSpecial(5699); -- "You can now become a puppetmaster."
            player:setVar("NoStringsAttachedProgress",0);
            player:setPetName(PETTYPE_AUTOMATON, option+118);
            player:unlockAttachment(8224); --Harlequin Frame
            player:unlockAttachment(8193); --Harlequin Head
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17859);
        end;
    end;
end;

