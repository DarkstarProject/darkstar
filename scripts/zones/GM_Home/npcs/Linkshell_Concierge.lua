-----------------------------------
-- Area: GM_Home
-- NPC: Linkshell_Concierge
-----------------------------------
package.loaded["scripts/zones/GM_Home/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/GM_Home/TextIDs");
require("scripts/globals/concierge");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- no real way to know what type these would on retail, so I just same dummy setting for all 3
    LinkShellConciergeEventTrigger(player,npc,0,dsp.lsconciergetype.EVERYTHING);
end;

function onEventUpdate(player,csid,option)
    LinkShellConciergeEventUpdate(player,csid,option);
end;

function onEventUpdate(player,csid,option)
    local lsCmd = option % 0x00000008 ;
    local res = LinkShellConciergeEventUpdate(player,csid,option);
    if ((lsCmd == 5) and (res == 98)) then -- dummy value for error
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,0x203)
        player:release(); -- probably not the best way to do this
    end
end;

function onEventFinish(player,csid,option)

    local res = LinkShellConciergeEventFinish(player,csid,option);

    if (res == 0) then
        -- Do nothing
    elseif (res == 1) then
        -- Listed Pearls
        player:messageText(player:getEventTarget(),LS_CONCIERGE_REGISTERED1);
        player:messageText(player:getEventTarget(),LS_CONCIERGE_REGISTERED2);
    elseif (res == 99) then -- dummy value we use for errors
        player:messageText(player:getEventTarget(),LS_CONCIERGE_ALREADY_LISTED);
    elseif (res == 2) then
        -- Aquired Pearl
        player:messageSpecial(ITEM_OBTAINED, 0x0203); -- Linkpearl
    elseif (res == 3) then
        -- Cancelled Pearl
        player:messageText(player:getEventTarget(),LS_CONCIERGE_LISTING_CANCEL);
    else
        player:PrintToPlayer(string.format("LSConFinish: Unexpected result for -- Result: %u -- CSID: %u -- option: %u", res,csid,option));
    end

end;
