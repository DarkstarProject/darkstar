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

    local stock = {0x43ed,496,1,        -- Bamboo Fishing Rod

             0x43f3,9,2,        -- Lugworm
             0x43ee,217,2,        -- Yew Fishing Rod

             0x43f4,3,3,        -- Little Worm
             0x13cc,110,3,        -- Scroll of Light Threnoldy
             0x13ca,1265,3,        -- Scroll of Lightning Threnoldy
             0x43ef,66,3}        -- Willow Fishing Rod

    showNationShop(player, NATION_SANDORIA, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
