-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Eugballion
-- Only sells when San d'Oria controlls Qufim Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)

    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    if (GetRegionOwner(QUFIMISLAND) ~= NATION_SANDORIA) then
        player:showText(npc,EUGBALLION_CLOSED_DIALOG);
    else
        player:showText(npc,EUGBALLION_OPEN_DIALOG);

        local stock = {954, 4121} -- Magic Pot Shard

        showShop(player,SANDORIA,stock);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
