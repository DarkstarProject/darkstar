-----------------------------------
-- Area: Metalworks
--  NPC: Takiyah
-- Type: Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (GetRegionOwner(dsp.region.QUFIMISLAND) ~= dsp.nation.BASTOK) then
        player:showText(npc,TAKIYAH_CLOSED_DIALOG);
    else
        player:showText(npc,TAKIYAH_OPEN_DIALOG);

        local stock =
        {0x03ba,4121}        -- Magic Pot Shard

        dsp.shop.general(player, stock, BASTOK);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;