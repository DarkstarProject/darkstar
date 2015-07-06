-----------------------------------
-- Area: Kazham
-- NPC: Magriffon
-- Involved in Quest: Gullible's Travels, Even More Gullible's Travels,
-- Location: (I-7)
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/npc_util")
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if(player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == 1) then
        tradedGil = trade:getGil();
        if(tradedGil >= player:getVar("MAGRIFFON_GIL_REQUEST")) then
            player:startEvent(0x0092);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if(player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == 0 and player:getFameLevel(KAZHAM) >= 6) then --Checks if Gullible's Travels hasn't been started or completed and that player has at least 6 Kazham fame
        player:setVar("MAGRIFFON_GIL_REQUEST", math.random(10000,30000));  --Generates an amount between 20,000 and 30,000 to request from the player
        player:startEvent(0x0090, 0, player:getVar("MAGRIFFON_GIL_REQUEST"));
    elseif(player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == 1) then --Checks if player is currently on Gullible's Travels
        player:startEvent(0x0091, 0, player:getVar("MAGRIFFON_GIL_REQUEST"));
    elseif(player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == 2) then --Checks if player has completed Gullible's Travels
        player:startEvent(0x0093);
    else
        player:startEvent(0x008F);
    end
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if(csid == 0x0090 and option == 1)  then
        player:addQuest(OUTLANDS, GULLIBLES_TRAVELS);
    elseif(csid == 0x0092) then
        player:tradeComplete();
        player:addGil(tradedGil - player:getVar("MAGRIFFON_GIL_REQUEST")); --Returns the player any extra gill they paid
        player:addFame(KAZHAM, WIN_FAME*30);
        player:setTitle(285); --Global Variable not working for this quest
        player:completeQuest(OUTLANDS, GULLIBLES_TRAVELS);
    end
end;
