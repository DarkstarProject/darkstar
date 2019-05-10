-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Deraquien
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -98 -2 31 230
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

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,4) == false) then
        player:startEvent(811);
    else
        player:startEvent(18);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 811) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",4,true);
    end

end;

---------other CS
--    player:startEvent(654) -- nothing to report
--    player:startEvent(33)-- theif of royl sceptre
--    player:startEvent(47)-- as again about the theif
--    player:startEvent(34) -- reminder of theif in la thein
--    player:startEvent(80)  -- thief caught but phillone was there
--    player:startEvent(20)  -- go get reward for thief
--    player:startEvent(87) -- vijrtall shows up and derq tells you go talk tho phillone
--    player:startEvent(30) --reminder go talk to phillone
--    player:startEvent(38) -- go help  retrieve royal sceptre
--    player:startEvent(27) -- the lady wanst involved in the theft :(
