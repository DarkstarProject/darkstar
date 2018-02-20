-----------------------------------
-- Area: Port San d'Oria
--  NPC: Vendavoq
-- Only sells when San d'Oria controls Movalpolos
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(MOVALPOLOS);

if (RegionOwner ~= NATION_SANDORIA) then
    player:showText(npc,VENDAVOQ_CLOSED_DIALOG);
else
    player:showText(npc,VENDAVOQ_OPEN_DIALOG);

    local stock = {0x0280,11,   --Copper Ore
             0x1162,694,  --Coral Fungus
             0x1117,4032, --Danceshroom
             0x0672,6500, --Kopparnickel Ore
             0x142d,736}  --Movalpolos Water

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

