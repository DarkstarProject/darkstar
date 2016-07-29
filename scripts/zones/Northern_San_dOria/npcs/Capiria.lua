-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Capiria
--  Type: Involved in Quest (Flyers for Regine)
--  @zone: 231
--  @pos -127.355 0.000 130.461
--
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeCapiria") == 0) then 
            player:messageSpecial(CAPIRIA_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeCapiria",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
            elseif (player:getVar("tradeCapiria") ==1) then
                player:messageSpecial(FLYER_ALREADY);
            end
        end
    end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,CAPIRIA_DIALOG);
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
end;
