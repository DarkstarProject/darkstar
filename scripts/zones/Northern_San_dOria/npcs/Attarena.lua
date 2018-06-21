-----------------------------------
--      Area: Northern San d'Oria
--      NPC: Attarena
--      Only sells when San d'Oria controlls Li'Telor Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(dsp.region.LITELOR);

        if (RegionOwner ~= dsp.nation.SANDORIA) then
                player:showText(npc,ATTARENA_CLOSED_DIALOG);
        else
                player:showText(npc,ATTARENA_OPEN_DIALOG);

                local stock = {0x026f,119,            -- Bay Leaves
                                 0x103a,6440}           -- Holy Water

                dsp.shop.general(player, stock, SANDORIA);
        end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

