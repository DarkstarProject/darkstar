-----------------------------------
-- Area: Port San d'Oria
--  NPC: Deguerendars
-- Only sells when San d'Oria contrls Tavnazian Archipelago
-- Only available to those with CoP Ch. 4.1 or higher
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

    local RegionOwner = GetRegionOwner(TAVNAZIANARCH);
    local cop = 40; --player:getVar("chainsOfPromathiaMissions");

    if (cop >= 40) then
        if (RegionOwner ~= NATION_SANDORIA) then
            player:showText(npc,DEGUERENDARS_CLOSED_DIALOG);
        else
            player:showText(npc,DEGUERENDARS_OPEN_DIALOG);

            local stock =
            {
                1523,  290,  -- Apple Mint
                5164,  1945, -- Ground Wasabi
                17005,  99,  -- Lufaise Fly
                5195,  233   -- Misareaux Parsley
            }
            showShop(player,SANDORIA,stock);
        end
    else
        player:showText(npc,DEGUERENDARS_COP_NOT_COMPLETED);
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
