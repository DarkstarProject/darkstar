-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Authere
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos 33 1 -31 230
-------------------------------------
require("scripts/globals/quests");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local WildcatSandy = player:getVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,1) == false) then
        player:startEvent(809);
    elseif (player:getVar("BrothersCS") == 1) then
        player:startEvent(597)  -- brothers cs
    else
        player:startEvent(605)  -- when i grow up im gonna fight like trion
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 809) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",1,true);
    elseif (csid == 597) then
        player:setVar("BrothersCS", 0)
    end
end;

------- for later use
-- player:startEvent(598)  -- did nothing no cs or speech