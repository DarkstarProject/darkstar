-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/besieged");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local hasAssault, keyitem = hasAssaultOrders(player);

    if (hasAssault > 0) then
        player:messageSpecial(RUNIC_PORTAL + 9, keyitem);
        player:startEvent(hasAssault);
    else
        if (player:hasKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)) then
            player:messageSpecial(RUNIC_PORTAL + 2,dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            player:startEvent(101,0,player:getNationTeleport(AHTURHGAN));
        else
            player:messageSpecial(RUNIC_PORTAL);
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 101) then
        if (option == 101) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP);
        elseif (option == 102) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.DVUCCA_SP);
        elseif (option == 103) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.MAMOOL_SP);
        elseif (option == 104) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.HALVUNG_SP);
        elseif (option == 105) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.ILRUSI_SP);
        elseif (option == 106) then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT);
            dsp.teleport.to(player, dsp.teleport.id.NYZUL_SP);
        end
    elseif (csid == 120 and option == 1) then -- dsp.ki.LEUJAOAM_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP);
    elseif (csid == 121 and option == 1) then -- MAMMOOL_JA_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.MAMOOL_SP);
    elseif (csid == 122 and option == 1) then -- dsp.ki.LEBROS_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.HALVUNG_SP);
    elseif (csid == 123 and option == 1) then -- dsp.ki.PERIQIA_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.DVUCCA_SP);
    elseif (csid == 124 and option == 1) then -- dsp.ki.ILRUSI_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.ILRUSI_SP);
    elseif (csid == 125 and option == 1) then -- dsp.ki.NYZUL_ISLE_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.NYZUL_SP);
    end
end;