-----------------------------------
--  Area: Southern San d'Oria
--  NPC:  Varchet
--  Type: NPC
--  @pos 116.484 -1 91.554 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

local GAME_WON = 0;
local GAME_LOST = 2;
local GAME_TIE = 3;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getGil() == 5 and trade:getItemCount() == 1) then
        player:tradeComplete();
        local vdie1 = math.random(1,6);
        local vdie2 = math.random(1,6);
        local vtotal = vdie1 + vdie2;
        local pdie1 = math.random(1,6);
        local pdie2 = math.random(1,6);
        local ptotal = pdie1 + pdie2;

        if (ptotal > vtotal) then
            player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_WON);
        elseif (vtotal > ptotal) then
            player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_LOST);
        elseif (ptotal == vtotal) then
            player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_TIE);
        end
    else
        player:startEvent(0x0260);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);

    if (exitTheGambler == QUEST_ACCEPTED) then
        player:startEvent(0x027e);
    else
        player:startEvent(0x020d);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("U CSID: %u",csid);
    -- printf("U RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("F CSID: %u",csid);
    -- printf("F RESULT: %u",option);

    local exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);
    local npc = player:getEventTarget();

    if (csid == 0x207) then
        if (option == GAME_WON) then
            if (exitTheGambler == QUEST_ACCEPTED) then
                player:completeQuest(SANDORIA,EXIT_THE_GAMBLER);
                player:showText(npc,VARCHET_KEEP_PROMISE);
            end
            local gilPayout = 10;
            player:addGil(gilPayout);
            player:messageSpecial(GIL_OBTAINED,gilPayout);
        elseif (option == GAME_TIE) then
            local gilPayout = 5;
            player:addGil(gilPayout);
            player:messageSpecial(GIL_OBTAINED,gilPayout);
        else
            player:messageSpecial(VARCHET_BET_LOST);
        end
    end
end;
