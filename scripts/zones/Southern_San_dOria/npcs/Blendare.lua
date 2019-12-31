-----------------------------------
-- Area: Southern San d'Oria
--   NPC: Blendare
-- Type: Standard NPC
-- !pos 33.033 0.999 -30.119 230
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getCharVar("tradeBlendare") == 0) then
            player:messageSpecial(ID.text.BLENDARE_DIALOG);
            player:addCharVar("FFR", -1)
            player:setCharVar("tradeBlendare",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getCharVar("tradeBlendare") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(606)  -- my brother always takes my sweets
--    player:startEvent(598)   --did nothing no speech or text
--    player:startEvent(945)    --black screen and hang
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 606) then
        player:setCharVar("BrothersCS", 1)
    end
end;
