-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Lusiane
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
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

    player:showText(npc,LUSIANE_SHOP_DIALOG);

    local stock = {17389,496,1,        -- Bamboo Fishing Rod

             17395,9,2,        -- Lugworm
             17390,217,2,        -- Yew Fishing Rod

             17396,3,3,        -- Little Worm
             5068,110,3,        -- Scroll of Light Threnoldy
             5066,1265,3,        -- Scroll of Lightning Threnoldy
             17391,66,3}        -- Willow Fishing Rod

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
